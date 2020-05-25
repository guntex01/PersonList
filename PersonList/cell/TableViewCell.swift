//
//  TableViewCell.swift
//  PersonList
//
//  Created by guntex01 on 5/22/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    var person: Person? {
        didSet {
            if let data = person {
                photoImageView.image = data.avatarImage
                label1.text = data.name
                label2.text = data.phone
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.orange
        
        photoImageView.layer.cornerRadius = photoImageView.bounds.height/2
        photoImageView.layer.masksToBounds = true
        photoImageView.layer.borderWidth = 1
        photoImageView.layer.borderColor = UIColor.white.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
