//
//  StationsViewController.swift
//  Tasty Radio
//
//  Created by Vitaliy Podolskiy on 11/28/20.
//  Copyright © 2020 DEVLAB, LLC. All rights reserved.
//

import UIKit

class StationsViewController: UIViewController {
    
    @IBOutlet var firebaseManager: FirebaseManager!
    
    @IBOutlet weak var bottonConstraint: NSLayoutConstraint!
    @IBOutlet weak var spacingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var genreImageView: UIImageView!
    
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.backgroundColor = .clear
            searchBar.delegate = self
            searchBar.backgroundImage = UIImage()
            searchBar.searchBarStyle = .prominent
            searchBar.setTextFieldColor(color: .clear)
            searchBar.tintColor = .dark2
            searchBar.barTintColor = .dark2
            searchBar.placeholder = "поиск по станциям"
            guard
                let textField = searchBar.textField else {
                return
            }
            textField.backgroundColor = .clear
            textField.font = .systemFont(ofSize: 14)
            textField.textColor = .dark9
            textField.keyboardAppearance = .dark
            
            if let searchImage = UIImage(named: "search-icon")?.scale(to: CGSize(width: 20, height: 20)) {
                searchBar.setImage(searchImage, for: .search, state: .normal)
            }
            if let clearImage = UIImage(named: "delete-icon")?.scale(to: CGSize(width: 20, height: 20)) {
                searchBar.setImage(clearImage, for: .clear, state: .normal)
            }
        }
    }
    
    @IBOutlet weak var leftIndicatorView: UIView! {
        didSet {
            leftIndicatorView.layer.cornerRadius = 2
        }
    }
    @IBOutlet weak var rightIndicatorView: UIView! {
        didSet {
            rightIndicatorView.layer.cornerRadius = 2
            rightIndicatorView.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.minimumLineSpacing = 0
            collectionView.collectionViewLayout = layout
            collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
            
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    @IBOutlet weak var playImageView: UIImageView! {
        didSet {
            playImageView.layer.cornerRadius = 18
        }
    }
    @IBOutlet weak var playTitleLabel: UILabel! {
        didSet {
            playTitleLabel.text = ""
        }
    }
    @IBOutlet weak var playSubtitleLabel: UILabel! {
        didSet {
            playSubtitleLabel.text = ""
        }
    }
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var genre: Genre! {
        didSet {
            reservedStations = genre.stations
            stations = reservedStations
        }
    }
    
    var stations: [Station] = []
    var reservedStations: [Station] = []
    
    private var selectedIndex = 0
    private var selectedStationIndex = 0
    
    private var gestureRecognizer: UITapGestureRecognizer {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideCursor))
        gesture.cancelsTouchesInView = false
        return gesture
    }
    
    private var isPlaying = false {
        didSet {
            updatePlayView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(gestureRecognizer)
        if genre != nil, let url = genre.imageUrl {
            genreImageView.kf.indicatorType = .activity
            genreImageView.kf.setImage(with: url)
        }
        
        self.bottonConstraint.constant = -84
        self.spacingConstraint.constant = 34
        self.view.layoutIfNeeded()
        
        firebaseManager.fetchStations { stations in
            self.stations = stations
            self.reservedStations = stations
            self.collectionView.reloadData()
        }
    }
    
    @IBAction func onBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onLeft(_ sender: UIButton) {
        sender.animateTap {
            self.selectedIndex = 0
            self.updateSortOrders()
        }
    }
    
    @IBAction func onRight(_ sender: UIButton) {
        sender.animateTap {
            self.selectedIndex = 1
            self.updateSortOrders()
        }
    }
    
    @objc private func hideCursor() {
        view.endEditing(true)
    }
    
    private func updateSortOrders() {
        switch selectedIndex {
        case 0:
            leftIndicatorView.backgroundColor = .dark10
            rightIndicatorView.backgroundColor = .clear
        default:
            leftIndicatorView.backgroundColor = .clear
            rightIndicatorView.backgroundColor = .dark10
        }
        self.collectionView.reloadData()
    }
    
    private func updatePlayView() {
        if isPlaying {
            self.bottonConstraint.constant = 0
            self.spacingConstraint.constant = 0
        }
        else {
            self.bottonConstraint.constant = -84
            self.spacingConstraint.constant = 34
        }
        UIView.animate(withDuration: TimeInterval(0.2)) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func onPrevious(_ sender: UIButton) {
        sender.animateTap {
            if self.selectedStationIndex > 0 {
                self.playStation(with: self.stations[self.selectedStationIndex - 1])
            }
        }
    }
    
    @IBAction func onStop(_ sender: UIButton) {
        sender.animateTap {
            self.isPlaying = false
        }
    }
    
    @IBAction func onNext(_ sender: UIButton) {
        sender.animateTap {
            if self.selectedStationIndex < self.stations.count - 1 {
                self.playStation(with: self.stations[self.selectedStationIndex + 1])
            }
        }
    }
    
}

extension StationsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

extension StationsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StationCollectionViewCell", for: indexPath) as! StationCollectionViewCell
        cell.backgroundColor = .clear
        cell.configure(with: stations[indexPath.item])
        cell.delegate = self
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        hideCursor()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let station = stations[indexPath.item]
        let playController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PlayViewController") as! PlayViewController
        playController.station = station
        playController.modalPresentationStyle = .fullScreen
        self.navigationController?.present(playController, animated: true, completion: nil)
        
        self.isPlaying = false
    }
}

extension StationsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 70)
    }
}

extension StationsViewController: StationCollectionViewCellDelegate {
    func playStation(with station: Station) {
        self.isPlaying = true
        if let index = stations.firstIndex(of: station) {
            self.selectedStationIndex = index
            self.updateButtonsState()
        }
        
        if let url = station.imageUrl {
            playImageView.kf.indicatorType = .activity
            playImageView.kf.setImage(with: url)
        }
        playTitleLabel.text = station.name
        playSubtitleLabel.text = station.info
    }

    private func updateButtonsState() {
        if selectedStationIndex == 0 {
            self.previousButton.isEnabled = false
            self.previousButton.tintColor = .dark5
        }
        else {
            self.previousButton.isEnabled = true
            self.previousButton.tintColor = .dark10
        }
        
        if selectedStationIndex == stations.count - 1 {
            self.nextButton.isEnabled = false
            self.nextButton.tintColor = .dark5
        }
        else {
            self.nextButton.isEnabled = true
            self.nextButton.tintColor = .dark10
        }
    }
}
