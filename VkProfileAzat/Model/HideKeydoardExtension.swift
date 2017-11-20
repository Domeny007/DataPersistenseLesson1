//
//  HideKeydoardExtension.swift
//  VkProfileAzat
//
//  Created by Азат Алекбаев on 30.10.2017.
//  Copyright © 2017 Азат Алекбаев. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardOnTap(_ selector: Selector) {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: selector)
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}
