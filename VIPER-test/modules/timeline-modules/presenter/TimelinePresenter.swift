//
//  TimelinePresenter.swift
//  VIPER-test
//
//  Created by 辻 悠一郎 on 2019/12/20.
//  Copyright © 2019 辻 悠一郎. All rights reserved.
//

import UIKit

protocol TimelinePresenterProtocol {
    func viewDidLoad()
}

class TimelinePresenter {
    
    private weak var view: TimelineView?
    private let router: TimelineWireframe
    private let timelineInteractor: TimelineInteractorProtocol
    
    private var timelineEntities: [TimelineEntity] = [] {
        didSet {
            view?.updateTimeline(timelineEntities)
        }
    }
    
    init(view: TimelineView,
         router: TimelineWireframe,
         interactor: TimelineInteractorProtocol) {
        self.view = view
        self.router = router
        self.timelineInteractor = interactor
    }
}

extension TimelinePresenter: TimelinePresenterProtocol {
    
    func viewDidLoad() {
        self.timelineInteractor.fetchTimeline { [weak self] result in
            switch result {
            case .success(let timelineEntities):
                self?.timelineEntities = timelineEntities
                print("Success!")
            case .failure:
                self?.timelineEntities.removeAll()
                print("Error!")
                break
            }
        }
    }
    
}

