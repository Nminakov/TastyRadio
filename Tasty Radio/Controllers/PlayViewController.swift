//
//  PlayViewController.swift
//  Tasty Radio
//
//  Created by Vitaliy Podolskiy on 11/29/20.
//  Copyright © 2020 DEVLAB, LLC. All rights reserved.
//

import UIKit
import Kingfisher
import AVFoundation

class PlayViewController: UIViewController {

    var station: Station?
    
    private var player: AVPlayer?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stationImageView: UIImageView!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard
            let station = station else {
            return
        }
        nameLabel.text = station.name
        if let url = station.imageUrl {
            stationImageView.kf.indicatorType = .activity
            stationImageView.kf.setImage(with: url)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.player = nil
    }
    
    @IBAction func onBack(_ sender: UIButton) {
        sender.animateTap {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func onFavourite(_ sender: UIButton) {
        sender.animateTap {
            
        }
    }
    
    @IBAction func onPrevious(_ sender: UIButton) {
        sender.animateTap {
            
        }
    }
    
    @IBAction func onPlayPause(_ sender: UIButton) {
        sender.animateTap {
            guard
                let url = self.station?.stationUrl else {
                return
            }
            
            self.player = AVPlayer(url: url)
            self.player?.play()
        }
    }
    
    @IBAction func onNext(_ sender: UIButton) {
        sender.animateTap {
            
        }
    }

}
