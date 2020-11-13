//
//  main.swift
//  playground
//
//  Created by Tae-Jin Oh on 2020/11/13.
//

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

var m1 : MediaItem = Movie(name: "Casablanca", director: "Michael Curtiz")
var m2 : Movie = Movie(name: "StarWars", director: "George Lucas")
var m3 : MediaItem = MediaItem(name: "D-War")
// var m4 : Movie = MediaItem(name: "Godzilla") // Error

print(m1 as MediaItem)
print(m2 as MediaItem)
print(m3 as MediaItem)
//playground.Movie
//playground.Movie
//playground.MediaItem

print(m1 as? Movie)
print(m2 as Movie)
print(m3 as? Movie)
//Optional(playground.Movie)
//playground.Movie
//nil
