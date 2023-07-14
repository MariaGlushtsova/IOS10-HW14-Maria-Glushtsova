//
//  UIView+Extensions.swift
//  IOS10-HW14-Maria Glushtsova
//
//  Created by Admin on 14.07.23.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        for view in views {
            view.addSubview(view)
        }
    }
}
