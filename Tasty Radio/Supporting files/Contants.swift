//
//  Contants.swift
//  Tasty Radio
//
//  Created by Vitaliy Podolskiy on 11/28/20.
//  Copyright © 2020 DEVLAB, LLC. All rights reserved.
//

import Foundation

struct GenresData {
    static var genres: [Genre] {
        let url = URL(string: "https://www.liveabout.com/thmb/uPosNSNMtE5Cj3LRV1wBLWtQ67E=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/silhouette-of-five-players-in-jazz-band--white-background-808891-005-59fcba5a4e4f7d001a6818a3.jpg")
        return [
            Genre(sortOrder: 0, name: "Жанр 1", imageUrl: url, stations: StationsData.stations),
            Genre(sortOrder: 1, name: "Жанр 2", imageUrl: url, stations: StationsData.stations),
            Genre(sortOrder: 2, name: "Жанр 3", imageUrl: url, stations: StationsData.stations),
            Genre(sortOrder: 3, name: "Жанр 4", imageUrl: url, stations: StationsData.stations),
            Genre(sortOrder: 4, name: "Жанр 5", imageUrl: url, stations: StationsData.stations),
            Genre(sortOrder: 5, name: "Жанр 6", imageUrl: url, stations: StationsData.stations),
            Genre(sortOrder: 6, name: "Жанр 7", imageUrl: url, stations: StationsData.stations),
            Genre(sortOrder: 7, name: "Жанр 8", imageUrl: url, stations: StationsData.stations),
            Genre(sortOrder: 8, name: "Жанр 9", imageUrl: url, stations: StationsData.stations),
            Genre(sortOrder: 9, name: "Жанр 10", imageUrl: url, stations: StationsData.stations),
            Genre(sortOrder: 10, name: "Жанр 11", imageUrl: url, stations: StationsData.stations),
            Genre(sortOrder: 11, name: "Жанр 12", imageUrl: url, stations: StationsData.stations),
            Genre(sortOrder: 12, name: "Жанр 13", imageUrl: url, stations: StationsData.stations),
            Genre(sortOrder: 13, name: "Жанр 14", imageUrl: url, stations: StationsData.stations),
            Genre(sortOrder: 14, name: "Жанр 15", imageUrl: url, stations: StationsData.stations),
            Genre(sortOrder: 15, name: "Жанр 16", imageUrl: url, stations: StationsData.stations),
            Genre(sortOrder: 16, name: "Жанр 17", imageUrl: url, stations: StationsData.stations),
            Genre(sortOrder: 17, name: "Жанр 18", imageUrl: url, stations: StationsData.stations),
            Genre(sortOrder: 18, name: "Жанр 19", imageUrl: url, stations: StationsData.stations),
            Genre(sortOrder: 19, name: "Жанр 20", imageUrl: url, stations: StationsData.stations)
        ]
    }
}

struct StationsData {
    static var stations: [Station] {
        let url = URL(string: "https://www.liveabout.com/thmb/uPosNSNMtE5Cj3LRV1wBLWtQ67E=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/silhouette-of-five-players-in-jazz-band--white-background-808891-005-59fcba5a4e4f7d001a6818a3.jpg")
        return [
            Station(sortOrder: 0, name: "Станция 1", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 1, name: "Станция 2", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 2, name: "Станция 3", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 3, name: "Станция 4", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 4, name: "Станция 5", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 5, name: "Станция 6", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 6, name: "Станция 7", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 7, name: "Станция 8", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 8, name: "Станция 9", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 9, name: "Станция 10", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 10, name: "Станция 11", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 11, name: "Станция 12", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 12, name: "Станция 13", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 13, name: "Станция 14", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 14, name: "Станция 15", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 15, name: "Станция 16", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 16, name: "Станция 17", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 17, name: "Станция 18", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 18, name: "Станция 19", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 19, name: "Станция 20", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 20, name: "Станция 21", imageUrl: url, rating: 2, info: "Джазовая станция"),
            Station(sortOrder: 21, name: "Станция 22", imageUrl: url, rating: 2, info: "Джазовая станция")
        ]
    }
}
