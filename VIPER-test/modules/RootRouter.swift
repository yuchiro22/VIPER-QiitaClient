//
//  RootRouter.swift
//  VIPER-test
//
//  Created by 辻 悠一郎 on 2019/12/25.
//  Copyright © 2019 辻 悠一郎. All rights reserved.
//

import UIKit

protocol RootWireFrame {
    func start(in window: UIWindow)
}

class RootRouter: RootWireFrame {
    func start(in window: UIWindow) {
        window.rootViewController = TimelineRouter.assembleModules()
        window.makeKeyAndVisible()
    }
}
