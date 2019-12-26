//
//  UIImage+Extension.swift
//  VIPER-test
//
//  Created by 辻 悠一郎 on 2019/12/26.
//  Copyright © 2019 辻 悠一郎. All rights reserved.
//

import UIKit

extension UIImage {
    public convenience init(url: String) {
        let url = URL(string: url)
        do {
            let data = try Data(contentsOf: url!)
            self.init(data: data)!
            return
        } catch let err {
            print(err.localizedDescription)
        }
        self.init()
    }
}
