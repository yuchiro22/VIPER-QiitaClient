//
//  TimelineCell.swift
//  VIPER-test
//
//  Created by 辻 悠一郎 on 2019/12/25.
//  Copyright © 2019 辻 悠一郎. All rights reserved.
//

import UIKit

class TimelineCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    func drawCell(entity: TimelineEntity) {
        titleLabel.text = entity.title
        //userNameLabel.text = entity.user.name
    }
}
