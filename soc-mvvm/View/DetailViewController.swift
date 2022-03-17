//
//  DetailViewController.swift
//  soc-mvp
//
//  Created by Леонід Квіт on 08.03.2022.
//

import UIKit
import MediaPlayer

class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModelType?
    
    //MARK: Private properties
    private enum UIConstants {
        static let topInset: CGFloat = 10
        static let leftRightInset: CGFloat = 16
        static let spacing: CGFloat = 50
    }
    
    private var player: AVPlayer! //AVQueuePlayer!
    
    //    private var imgTrack: UIImageView = {
    //        let imgView = UIImageView()
    //        imgView.clipsToBounds = true
    //        imgView.contentMode = .scaleAspectFill
    //
    //        return imgView
    //    }()
    
    private var lblTrack: UILabel = {
        let lbl = UILabel(text: "Audio", font: UIFont.euphemia24())
        //lbl.numberOfLines = 0
        
        return lbl
    }()
    
    private var lblAlbum: UILabel = {
        let lbl = UILabel(text: "Album", font: UIFont.euphemia17())
        //lbl.numberOfLines = 0
        
        return lbl
    }()
    
    private var lblCurrentTime: UILabel = {
        let lbl = UILabel(text: "00:00", font: UIFont.euphemia17())
        
        return lbl
    }()
    
    private var lblDuration: UILabel = {
        let lbl = UILabel(text: "00:00", font: UIFont.euphemia17())
        
        return lbl
    }()
    
    private var durationSlider: UISlider = {
        let slider = UISlider()
        slider.tintColor = .white
        slider.addTarget(self, action: #selector(changeDurationSlider), for: .valueChanged)
        
        return slider
    }()
    
    private var playButton: UIButton = {
        let btn = UIButton(type: .roundedRect)
        btn.tintColor = .white
        //btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn.setImage(UIImage(systemName: "play.fill"), for: .normal)
        btn.addTarget(self, action: #selector(playButtonIsTapped(sender:)), for: .touchUpInside)
        
        return btn
    }()
    
    //    private var backwardButton: UIButton = {
    //        let btn = UIButton(type: .roundedRect)
    //        btn.setImage(UIImage(systemName: "backward.fill"), for: .normal)
    //        btn.addTarget(self, action: #selector(backwardButtonIsTapped(sender:)), for: .touchUpInside)
    //
    //        return btn
    //    }()
    //
    //    private var forwardButton: UIButton = {
    //        let btn = UIButton(type: .roundedRect)
    //        btn.setImage(UIImage(systemName: "forward.fill"), for: .normal)
    //        btn.addTarget(self, action: #selector(forwardButtonIsTapped(sender:)), for: .touchUpInside)
    //
    //        return btn
    //    }()
    
    //MARK: - Action
    @objc func playButtonIsTapped(sender: Any) {
        if player.timeControlStatus == .paused {
            play()
        } else {
            pause()
        }
    }
    
    private func play() {
        let pauseImage = UIImage(systemName: "pause.fill")
        playButton.setImage(pauseImage, for: .normal)
        player.play()
    }
    
    private func pause() {
        let playImage = UIImage(systemName: "play.fill")
        playButton.setImage(playImage, for: .normal)
        player.pause()
    }
    
    //    @objc func backwardButtonIsTapped(sender: Any) {
    //
    //    }
    //
    //    @objc func forwardButtonIsTapped(sender: Any) {
    //        print("forward")
    //    }
    
    @objc func changeDurationSlider(_ sender: Any) {
        player.seek(to: CMTime(seconds: Double(durationSlider.value), preferredTimescale: 100))
        lblCurrentTime.text = secToTime(duration: Double(durationSlider.value))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //створюємо бекграунд для view
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "bg")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
        title = "Сейчас воспроизводится"
        //змінюємо атрибути заголовку NavigationBar
        let dict:NSDictionary = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.euphemia17() as Any]
        self.navigationController?.navigationBar.titleTextAttributes = dict as? [NSAttributedString.Key : Any]
        self.navigationController?.navigationBar.tintColor = .white
        
        setData()
        setConstraints()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        player = nil
    }
    
}

//MARK: - Set data
extension DetailViewController {
    func setData() {
        
        guard let track = viewModel else { return }
        //imgTrack.image = model.image
        lblTrack.text = track.trackName
        lblAlbum.text = track.album
        lblCurrentTime.text = secToTime(duration: nil)
        
        player = AVPlayer(url: URL(string: track.url)!)
        //якщо файл знаходиться в додатку
        //player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "music", ofType: "mp3")!))
        
        if let sliderMaxValue = player.currentItem?.asset.duration.seconds {
            durationSlider.maximumValue = Float(sliderMaxValue) //Float(model.duration)
            lblDuration.text = secToTime(duration: sliderMaxValue)
        } else {
            durationSlider.maximumValue = 0
            lblDuration.text = secToTime(duration: nil)
        }
        
        player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1000), queue: DispatchQueue.main) { (time) in
            self.lblCurrentTime.text = secToTime(duration: time.seconds)
            self.durationSlider.value = Float(time.seconds)
        }
    }
}

//MARK: - Constraints
extension DetailViewController {
    func setConstraints() {
        //        imgTrack.translatesAutoresizingMaskIntoConstraints = false
        //        view.addSubview(imgTrack)
        //        NSLayoutConstraint.activate([
        //            imgTrack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIConstants.topInset),
        //            imgTrack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        //            imgTrack.heightAnchor.constraint(equalToConstant: 300),
        //            imgTrack.widthAnchor.constraint(equalToConstant: 300)
        //        ])
        
        let stackView_Track = UIStackView(arrangedSubviews: [lblTrack,
                                                             lblAlbum])
        stackView_Track.axis = .vertical
        stackView_Track.distribution = .equalCentering
        stackView_Track.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView_LblDuration = UIStackView(arrangedSubviews: [lblCurrentTime, lblDuration])
        stackView_LblDuration.axis = .horizontal
        stackView_LblDuration.distribution = .equalCentering
        stackView_LblDuration.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView_Duration = UIStackView(arrangedSubviews: [durationSlider, stackView_LblDuration])
        stackView_Duration.axis = .vertical
        stackView_Duration.distribution = .equalCentering
        stackView_Duration.translatesAutoresizingMaskIntoConstraints = false
        
        
        let stackView_Main = UIStackView(arrangedSubviews: [stackView_Track,
                                                            stackView_Duration,
                                                            playButton])
        stackView_Main.axis = .vertical
        stackView_Main.spacing = UIConstants.spacing
        stackView_Main.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView_Main)
        NSLayoutConstraint.activate([
            //stackView_Main.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIConstants.topInset),
            stackView_Main.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIConstants.leftRightInset),
            stackView_Main.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIConstants.leftRightInset),
            stackView_Main.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -UIConstants.topInset),
        ])
        
    }
}
