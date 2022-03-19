//
//  UIView+Extension.swift
//  soc-mvvm
//
//  Created by Леонід Квіт on 19.03.2022.
//

import UIKit

extension UIView {
    func setBackgroundImage(named: String) {
        //создаем бекграунд для view
        UIGraphicsBeginImageContext(self.frame.size)
        UIImage(named: named)?.draw(in: self.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        backgroundColor = UIColor(patternImage: image)
    }
}
