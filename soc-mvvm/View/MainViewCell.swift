//
//  MainViewCell.swift
//  soc-mvvm
//
//  Created by Леонід Квіт on 12.03.2022.
//

import UIKit

class MainViewCell: UITableViewCell {
    
    //MARK: Private properties
    private enum UIConstants {
        static let topInset: CGFloat = 10
        static let leftRightInset: CGFloat = 16
        static let spacing: CGFloat = 20
    }
    
    private lazy var trackImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        return imgView
    }()
    
    private let trackName = UILabel(text: "Программирование", font: .euphemia17(), aligment: .left)
    private let trackDescription = UILabel(text: "Научиться писать екстеншн и правильно их применять", font: .euphemia11(), aligment: .right)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func configure(model: Track?) {
//        guard let model = model else {
//            return
//        }
//        trackName.text = model.name
//        trackDescription.text = model.duration.description
//        trackDescription.numberOfLines = 2
//        trackDescription.lineBreakMode = .byWordWrapping
//        trackImageView.image = model.image//UIImage(named: "play")
//    }
    
    weak var viewModel: MainViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            trackName.text = viewModel.trackName
            trackDescription.text = viewModel.trackDescription
            trackImageView.image = UIImage.getImage(from: viewModel.trackImageView)
        }
    }
    
    private func setConstraints() {
        
        self.addSubview(trackImageView)
        NSLayoutConstraint.activate([
            trackImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: UIConstants.topInset),
            //trackImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            trackImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: UIConstants.leftRightInset),
            //trackImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -UIConstants.leftRightInset),
            trackImageView.heightAnchor.constraint(equalToConstant: 50),
            trackImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        self.addSubview(trackName)
                NSLayoutConstraint.activate([
                    trackName.topAnchor.constraint(equalTo: self.topAnchor, constant: UIConstants.topInset),
                    trackName.leadingAnchor.constraint(equalTo: trackImageView.trailingAnchor, constant: UIConstants.spacing),
                    trackName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -UIConstants.leftRightInset),
                    //trackName.heightAnchor.constraint(equalToConstant: 25)
                ])
        
        self.addSubview(trackDescription)
                NSLayoutConstraint.activate([
                    trackDescription.topAnchor.constraint(equalTo: trackName.bottomAnchor, constant: 0),
                    trackDescription.leadingAnchor.constraint(equalTo: trackImageView.trailingAnchor, constant: UIConstants.spacing),
                    trackDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -UIConstants.leftRightInset),
                    trackDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
                ])
        
    }
}
