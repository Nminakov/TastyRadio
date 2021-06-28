//
//  FirebaseManager.swift
//  Tasty Radio
//
//  Created by Vitaliy Podolskiy on 12/12/20.
//  Copyright © 2020 DEVLAB, LLC. All rights reserved.
//

import Foundation
import Firebase

class FirebaseManager: NSObject {
    
    func fetchGenres(callback: @escaping ([Genre]) -> Void) {
        let db = Firestore.firestore()
        db.collection("Genres").getDocuments { (snapshot, error) in
            guard
                error == nil,
                let snapshot = snapshot else {
                return
            }
            var genres: [Genre] = []
            let array = snapshot.documents
            array.forEach { item in
                if let name = item["name"] as? String {
                    let genre = Genre(sortOrder: 0, name: name, imageUrl: nil, stations: [])
                    genres.append(genre)
                }
            }
            
            callback(genres)
        }
    }
    
    func fetchStations(callback: @escaping ([Station]) -> Void) {
        let db = Firestore.firestore()
        db.collection("Stations").getDocuments { (snapshot, error) in
            guard
                error == nil,
                let snapshot = snapshot else {
                return
            }
            var stations: [Station] = []
            let array = snapshot.documents
            array.forEach { item in
                if let name = item["name"] as? String,
                   let stream = item["stream"] as? String,
                   let cover = item["cover"] as? String
                {
                    let station = Station(stationId: item.documentID, sortOrder: 0, name: name, imageUrl: URL(string: cover), stationUrl: URL(string: stream), rating: 0, info: "")
                    stations.append(station)
                }
            }
            
            callback(stations)
        }
    }
    
}

/*
 struct Station {
     var stationId = UUID().uuidString
     var sortOrder: Int
     var name: String
     var imageUrl: URL?
     var stationUrl: URL?
     
     var rating: Int
     var info: String
 }

 */
