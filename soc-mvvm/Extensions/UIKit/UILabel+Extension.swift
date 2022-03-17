//
//  File.swift
//  Schedule
//
//  Created by Леонід Квіт on 06.11.2021.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont?, aligment: NSTextAlignment = .left) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = .white
        self.textAlignment = aligment
        //self.adjustsFontSizeToFitWidth = true
        self.numberOfLines = 2
        self.lineBreakMode = .byWordWrapping
        self.translatesAutoresizingMaskIntoConstraints = false
        //self.backgroundColor = .systemRed
    }
}

