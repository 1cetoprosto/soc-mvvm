//
//  Soc.swift
//  soc-mvvm
//
//  Created by Леонід Квіт on 12.03.2022.
//

import Foundation

// MARK: - Soc
public struct Soc: Codable {
    let name: String
    let image: String
    let text: String
    let series: [Series]
}

// MARK: - Series
struct Series: Codable {
    let name: String
    let lessons: [Lesson]
}

// MARK: - Lesson
struct Lesson: Codable {
    let number: Int
    let name: String
    let image: String
    let duration: Int
    let url: String
}

//MARK: - Model
var socName: String = ""
var socUrlImage: String = ""
var socText: String = ""

// MARK: - Series
struct Album {
    let name: String
    let tracks: [Track]
}

// MARK: - Lesson
struct Track {
    let number: Int?
    let name: String
    let albumName: String
    let duration: String
    let url: String
    let image: String
}

var albumArray: [Album] = []
