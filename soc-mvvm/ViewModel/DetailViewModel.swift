//
//  DetailViewModel.swift
//  soc-mvvm
//
//  Created by Леонід Квіт on 12.03.2022.
//

import Foundation

class DetailViewModel: DetailViewModelType {

    private var track: Track
    
    var album: String {
        return track.albumName
    }
    
    var duration: String {
        return track.duration
    }
    
    var trackName: String {
        return track.name
    }
    
    var url: String {
        return track.url
    }
    
    //var age: Box<String?> = Box(nil)
    
    init(track: Track) {
        self.track = track
    }
    
}
