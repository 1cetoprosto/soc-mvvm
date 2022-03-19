//
//  UIImage+Extension.swift
//  soc-mvp
//
//  Created by Леонід Квіт on 08.03.2022.
//

import UIKit

extension UIImage {
    
    static func getImage(from stringUrl: String) -> UIImage? {
        var img: UIImage?
        
        guard let url = URL(string: stringUrl) else { return nil }
        if let data = try? Data(contentsOf: url) {
            img = UIImage(data: data)
        } else {
            img = nil
        }
        
        return img
    }
}
