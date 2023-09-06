//
//  LessonTableViewCell.swift
//  schoolITimeTable
//
//  Created by student on 2023/05/16.
//

import UIKit

class LessonTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var teacherLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
        func configure(title: String, teacherName: String) {
            titleLabel.text = title
            teacherLabel.text = teacherName
        }
    }


