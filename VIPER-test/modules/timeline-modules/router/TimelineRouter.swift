//
//  TimelineRouter.swift
//  VIPER-test
//
//  Created by 辻 悠一郎 on 2019/12/20.
//  Copyright © 2019 辻 悠一郎. All rights reserved.
//

import UIKit

protocol TimelineWireframe {
    
}

class TimelineRouter: TimelineWireframe {
    
    private unowned let timelineView: UIViewController
    
    private init(viewController: UIViewController) {
        self.timelineView = viewController
    }
    
    // DI
    static func assembleModules() -> UIViewController {
        let view = TimelineTableViewController()
        let router = TimelineRouter(viewController: view)
        let timelineInteractor = TimelineInteractor()
        let presenter = TimelinePresenter(view: view,
                                          router: router,
                                          interactor: timelineInteractor)
        view.presenter = presenter
        
        return view
    }
    
    
}
