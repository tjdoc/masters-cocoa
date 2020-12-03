//
//  PlayerModel.swift
//  Continuous
//
//  Created by Tae-Jin Oh on 2020/12/03.
//

import Foundation
import MediaPlayer

class Flow {
    var playlistArr, genreArr: [MPMediaItemCollection]?
//    var playlistArr, genreArr, albumArr, artistArr, songArr, composerArr, compilationArr, podcastArr, audiobookArr: [MPMediaItemCollection]?
    let mydic: [Int:[MPMediaItemCollection]]
    let audioCategory = ["Playlists", "Genres"]
    var sectionIdx = 0
    var itemIdx = 0
    var currentSongIdx = 0
    var songs: [MPMediaItem]?
    let musicPlayer = MPMusicPlayerController.applicationQueuePlayer
    init() {
        self.playlistArr = MPMediaQuery.playlists().collections
        self.genreArr = MPMediaQuery.genres().collections        
        self.mydic = [0: self.playlistArr!, 1: self.genreArr!]
    }
    func getAuthorization() {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                print("Authorized")
            } else {
                print("Not Authorized. This app will not work as indtended.")
            }
        }
    }
    func getSongs() {
        self.songs = self.mydic[sectionIdx]![self.itemIdx].items
    }
    func playSongs() {
        self.getSongs()
        if let songs = self.songs {
            guard !songs.isEmpty else { return }
            musicPlayer.setQueue(with: MPMediaItemCollection(items: songs))
            musicPlayer.prepareToPlay()
            musicPlayer.play()
        }
    }
    func toBeginning() {
        self.getSongs()
        if let songs = self.songs {
            guard !songs.isEmpty else { return }
            musicPlayer.setQueue(with: MPMediaItemCollection(items: songs))
            musicPlayer.prepareToPlay()
        }
    }
}


