//
//  MainViewViewModelType.swift
//  soc-mvvm
//
//  Created by Леонід Квіт on 12.03.2022.
//

import Foundation

protocol MainViewViewModelType {
    func getLessons(completion: @escaping() -> ())
    
    func numberOfSections() -> Int
    func numberOfRowInSection(for section: Int) -> Int
    func titleForHeaderInSection(for section: Int) -> String
    func cellViewModel(for indexPath: IndexPath) -> MainViewCellViewModelType?
    
    func viewModelForSelectedRow() -> DetailViewModelType?
    func selectRow(atIndexPath indexPath: IndexPath)
}
