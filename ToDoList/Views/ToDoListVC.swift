//
//  ToDoListVC.swift
//  ToDoList
//
//  Created by Melik Demiray on 14.04.2024.
//

import UIKit

class ToDoListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var toDo = ToDo(toDoText: "süt al", isDone: false, id: UUID(), date: Date())

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()

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


}

extension ToDoListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoListCell", for: indexPath) as! ToDoListCell
        cell.setCell(with: toDo)
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
