//
//  ToDoListCell.swift
//  ToDoList
//
//  Created by Melik Demiray on 14.04.2024.
//

import UIKit

class ToDoListCell: UITableViewCell {

    @IBOutlet weak var toDoLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func checkBtnClicked(_ sender: Any) {

    }

    func setCell(toDo: ToDo?) {

        guard let toDo = toDo else { return }
        //toDoLabel.text = toDo.toDoText

        if toDo.isDone ?? false {
            checkButton.setImage(UIImage(named: "check"), for: .normal)
            checkButton.imageView?.contentMode = .scaleAspectFit
        } else {
            checkButton.setImage(UIImage(named: "cross"), for: .normal)
            checkButton.imageView?.contentMode = .scaleAspectFit
        }

    }

}
