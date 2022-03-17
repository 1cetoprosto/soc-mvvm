//
//  MainViewCellViewModel.swift
//  soc-mvvm
//
//  Created by Леонід Квіт on 12.03.2022.
//

import Foundation

class MainViewCellViewModel: MainViewCellViewModelType {
  
    private var track: Track
    
    var trackImageView: String {
        return track.image
    }

    var trackName: String {
        return track.name
    }

    var trackDescription: String {
        return track.duration
    }
    
    init(track: Track) {
        self.track = track
    }
    
}


