//
//  MainViewCellViewModelType.swift
//  soc-mvvm
//
//  Created by Леонід Квіт on 12.03.2022.
//

import Foundation
//import UIKit

protocol MainViewCellViewModelType: AnyObject {
    var trackImageView: String { get }
    var trackName: String { get }
    var trackDescription: String { get }
}
