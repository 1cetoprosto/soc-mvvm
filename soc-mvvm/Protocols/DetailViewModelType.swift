//
//  DetailViewModelType.swift
//  soc-mvvm
//
//  Created by Леонід Квіт on 12.03.2022.
//

import Foundation

protocol DetailViewModelType {
    var album: String { get }
    var trackName: String { get }
    var duration: String { get }
    var url: String { get }
    //var age: Box<String?> { get }
}
