//
//  TimelineTableViewController.swift
//  VIPER-test
//
//  Created by 辻 悠一郎 on 2019/12/20.
//  Copyright © 2019 辻 悠一郎. All rights reserved.
//

import UIKit

protocol TimelineView: class {
    func updateTimeline(_ timelineEntities: [TimelineEntity])
}

class TimelineTableViewController: UIViewController {
    
    let tableView = UINib(nibName: "tableView", bundle: nil).instantiate(withOwner: self, options: nil).first as! UITableView
    
    var presenter: TimelinePresenterProtocol!
    
    private var timelineEntities: [TimelineEntity] = [
        ] {
        didSet {
            // 画面更新
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "timelineCell", bundle: nil), forCellReuseIdentifier: "timelineCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        presenter.viewDidLoad()
    }
}

extension TimelineTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.timelineEntities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "timelineCell", for: indexPath) as? TimelineCell {
            cell.drawCell(entity: timelineEntities[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
}

extension TimelineTableViewController: TimelineView {
    
    func updateTimeline(_ timelineEntities: [TimelineEntity]) {
        self.timelineEntities = timelineEntities
    }
}
