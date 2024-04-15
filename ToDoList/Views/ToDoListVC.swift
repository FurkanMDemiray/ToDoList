//
//  ToDoListVC.swift
//  ToDoList
//
//  Created by Melik Demiray on 14.04.2024.
//

import UIKit
import FirebaseFirestore

class ToDoListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var toDoList = [ToDo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        //getToDoList()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getToDoList()
    }

    @IBAction func addBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: "toAddVC", sender: nil)
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ToDoListCell", bundle: nil), forCellReuseIdentifier: "toDoListCell")
        tableView.rowHeight = 40
    }

    func getToDoList() {
        // get data from firestore
        let db = Firestore.firestore()
        db.collection("ToDoList").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                self.toDoList.removeAll()
                for document in querySnapshot!.documents {
                    var toDo = ToDo()
                    if let id = document.get("id") {
                        toDo.id = id as? String
                    }
                    if let toDoText = document.get("toDoText") {
                        toDo.toDoText = toDoText as? String
                    }
                    if let timestamp = document.get("date") as? Timestamp {
                        let date = timestamp.dateValue()
                        toDo.date = date
                    }
                    if let isDone = document.get("isDone") {
                        toDo.isDone = isDone as? Bool
                    }
                    self.toDoList.append(toDo)
                }
                print(self.toDoList)
            }
            self.tableView.reloadData()
        }
    }


}

extension ToDoListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoListCell", for: indexPath) as! ToDoListCell
        cell.setCell(with: toDoList[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // change image
        let cell = tableView.cellForRow(at: indexPath) as! ToDoListCell
        cell.changeImage()

        // change isDone
        //toDo.isDone = !toDo.isDone!

    }
}
