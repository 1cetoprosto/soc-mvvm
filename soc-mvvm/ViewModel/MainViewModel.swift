//
//  MainViewModel.swift
//  soc-mvvm
//
//  Created by Леонід Квіт on 12.03.2022.
//

import Foundation

class MainViewModel: MainViewViewModelType {
    
    private var selectedIndexPath: IndexPath?
    private var networkService: NetworkService!
    private var albumArray: [Album]?
    
    func getLessons(completion: @escaping() -> ()) {
        let networkService = NetworkService()
        networkService.getLessons { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let albumArray):
                    self.albumArray = albumArray
                    completion()
                    //self.view?.succes()
                case .failure(let error):
                    print("Error getLessons: \(error.localizedDescription)")
                    //self.view?.failure(error: error)
                }
            }
        }
    }
    
    func numberOfSections() -> Int {
        guard let albumArray = self.albumArray else { return 0 }
        return albumArray.count
    }
    
    func numberOfRowInSection(for section: Int) -> Int {
        guard let albumArray = self.albumArray else { return 1 }
        return albumArray[section].tracks.count
    }
    
    func titleForHeaderInSection(for section: Int) -> String {
        guard let albumArray = self.albumArray else { return "" }
        return albumArray[section].name
    }
    
    func cellViewModel(for indexPath: IndexPath) -> MainViewCellViewModelType? {
        guard let albumArray = self.albumArray else { return nil }
        let track = albumArray[indexPath.section].tracks[indexPath.row]
        return MainViewCellViewModel(track: track)
    }
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let selectedIndexPath = selectedIndexPath,
              let albumArray = self.albumArray else { return nil }
        let track = albumArray[selectedIndexPath.section].tracks[selectedIndexPath.row]
        return DetailViewModel(track: track)
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
}
