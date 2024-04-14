//
//  ToDoListCell.swift
//  ToDoList
//
//  Created by Melik Demiray on 14.04.2024.
//

import UIKit

class ToDoListCell: UITableViewCell {


    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var imageCheck: UIImageView!

    // add gesture recognizer to the image
    override func awakeFromNib() {
        super.awakeFromNib()
        let tap = UITapGestureRecognizer(target: self, action: #selector(checkButtonTapped))
        imageCheck.addGestureRecognizer(tap)
        imageCheck.isUserInteractionEnabled = true
        // set size of the image
        imageCheck.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    }

    @objc func checkButtonTapped() {
        print("check button tapped")
    }

    func setCell(with toDoModel: ToDo) {
        label.text = toDoModel.toDoText

        if toDoModel.isDone ?? false {
            imageCheck.image = UIImage(named: "check")


        } else {
            imageCheck.image = UIImage(named: "cross")
        }
    }

}
