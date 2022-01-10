//
//  SDGiftPalyerConfig.swift
//  SDGiftPlayerManager
//
//  Created by daixingchuang on 2022/1/10.
//

import UIKit

extension UIWindow {
    static var GiftPalyerkeyWindow: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
//推荐使用这个keyWindow
let kGiftPalyerkeyWindow = UIWindow.GiftPalyerkeyWindow

let anWidth: CGFloat = 300.0 //UIScreen.main.bounds.width
let anHeight: CGFloat = 300.0 //UIScreen.main.bounds.height
