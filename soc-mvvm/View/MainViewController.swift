//
//  MainViewController.swift
//  soc-mvvm
//
//  Created by Леонід Квіт on 12.03.2022.
//

import UIKit

class MainViewController: UIViewController {

    private var viewModel: MainViewViewModelType?
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.separatorColor = .white
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private let idTrackCell = "idTrackCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //создаем бекграунд для view
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "bg")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        view.backgroundColor = UIColor(patternImage: image)
        
        navigationItem.title = "Школа Христа (аудио-уроки)"
        
        // Изменяем атрибуты заголовка NavigationBar
        let dict: NSDictionary = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.euphemia24() as Any]
        self.navigationController?.navigationBar.titleTextAttributes = dict as? [NSAttributedString.Key : Any]
        
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.frame = view.bounds
        tableView.register(MainViewCell.self, forCellReuseIdentifier: idTrackCell)
        
        setConstraints()
        
        viewModel = MainViewModel()
        viewModel?.getLessons { [weak self] in
            self?.tableView.reloadData()
        }
    }

}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel?.titleForHeaderInSection(for: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections() ?? 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowInSection(for: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idTrackCell, for: indexPath) as? MainViewCell
 
        guard let tableViewCell = cell,
        let viewModel = viewModel else { return UITableViewCell() }
        
        let cellViewModel = viewModel.cellViewModel(for: indexPath)

        tableViewCell.viewModel = cellViewModel
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        viewModel.selectRow(atIndexPath: indexPath)
        let detailViewModel = viewModel.viewModelForSelectedRow()
        
        let detailVC = DetailViewController()
        detailVC.viewModel = detailViewModel
        navigationController?.pushViewController(detailVC, animated: true)
        //presenter.tapOnTheTrack(track: track)
    }
}

//MARK: - setConstraints
extension MainViewController {
    
    func setConstraints() {
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}
