//
//  TimelineEntity.swift
//  VIPER-test
//
//  Created by 辻 悠一郎 on 2019/12/20.
//  Copyright © 2019 辻 悠一郎. All rights reserved.
//

import Foundation

struct TimelineEntity: Codable {
    var title: String
    var user: User
    
    struct User: Codable {
        var name: String
    }
}

struct TimelineEntityMock: Codable {
    var title: String
}
