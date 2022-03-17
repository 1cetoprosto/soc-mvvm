//
//  UIImage+Extension.swift
//  soc-mvp
//
//  Created by Леонід Квіт on 08.03.2022.
//

import UIKit

extension UIImage {
    
    static func getImage(from url: String) -> UIImage? {
        var img: UIImage?
        
        let tempUrl = URL(string: url)
        if let data = try? Data(contentsOf: tempUrl!) {
            img = UIImage(data: data)
        } else {
            img = nil
        }
        
        return img
    }
}