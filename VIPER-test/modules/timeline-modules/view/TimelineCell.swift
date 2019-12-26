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
    @IBOutlet weak var userImage: UIImageView!
    
    func drawCell(entity: TimelineEntity) {
        userImage.image = UIImage(url: entity.user.profile_image_url)
        titleLabel.text = entity.title
        userNameLabel.text = entity.user.name
    }
}
