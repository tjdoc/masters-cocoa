//
//  MusicViewController.swift
//  Flow Playlist
//
//  Created by Tae-Jin Oh on 2020/11/30.
//

import MediaPlayer
import UIKit

class MusicViewController: UIViewController {
    
    @IBOutlet var bgGradientView: UIView!
    @IBOutlet weak var artwork: UIImageView!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var songTime: UILabel!
    @IBOutlet weak var timeLeft: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var lyricsBtn: UIButton!
    @IBOutlet weak var prevBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var volumeView: UIView!
    @IBOutlet weak var lyricsTextView: UITextView!
    
    var myflow = Flow()
    var layerInit = false
    var oldLayer: CALayer?
    var lyricsMode = false
    var lyricsAvailable = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBtn.setTitle("॥", for: .normal) // ▶️
        lyricsBtn.setTitle("ℒ", for: .normal) //
        prevBtn.setTitle("⇠", for: .normal) // ⏪
        nextBtn.setTitle("⇢", for: .normal) // ⏩

        let mpVolume = MPVolumeView(frame: volumeView.bounds)
        volumeView.addSubview(mpVolume)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateSongInfo), name: NSNotification.Name.MPMusicPlayerControllerNowPlayingItemDidChange, object: nil)
        myflow.musicPlayer.beginGeneratingPlaybackNotifications()
        let _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)

        myflow.playSongs()
    }
    
    deinit {
        myflow.musicPlayer.endGeneratingPlaybackNotifications()
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func updateProgress() {
        guard let totalTime = myflow.musicPlayer.nowPlayingItem?.playbackDuration else {
            timeLeft.text = "?"
            progressBar.progress = 0.0
            return
        }
        let currentTime = myflow.musicPlayer.currentPlaybackTime
        timeLeft.text = "-"+getTime(totalTime-currentTime)
        progressBar.progress = Float(currentTime)/Float(totalTime)
    }
    
    @objc func updateSongInfo() {
        songName.text = myflow.musicPlayer.nowPlayingItem?.title ?? "Unknown"
        artistName.text = myflow.musicPlayer.nowPlayingItem?.artist ?? "Unknown"
        artwork.image = myflow.musicPlayer.nowPlayingItem?.artwork?.image(at: CGSize(width: (view.frame.width), height: (view.frame.width)))
        songTime.text = getTime(myflow.musicPlayer.nowPlayingItem?.playbackDuration)
        timeLeft.text = "-"+songTime.text!
        progressBar.progress = 0.0
        
        
        if myflow.musicPlayer.nowPlayingItem?.lyrics! != ""  {
            lyricsTextView.text = myflow.musicPlayer.nowPlayingItem?.lyrics!
            lyricsAvailable = true
        } else {
            lyricsAvailable = false
        }
        self.showLyrics()
        
        if myflow.musicPlayer.nowPlayingItem?.artwork != nil {
            generateBackground(avgColor: (myflow.musicPlayer.nowPlayingItem!.artwork!.image(at: CGSize(width: 10, height: 10))?.averageColor)!)
        } else {
            generateBackground(avgColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1))
        }
    }

    func getTime(_ doubleTime: Double?) -> String {
        if let dt = doubleTime {
            let intTime = Int(dt)
            let ss = intTime%60
            let mm = intTime/60
            let hh = intTime/3600
            return hh > 0 ? String(format:"%d:%02d:%02d", hh, mm, ss) : mm > 0 ? String(format:"%d:%02d", mm, ss) : "\(ss)"
        } else {
            return "Unknown"
        }
    }
    
    func generateBackground(avgColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [self.brighten(avgColor, 0.8).cgColor, self.brighten(avgColor, 0.2).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // Top left corner.
        gradientLayer.endPoint = CGPoint(x: 1, y: 1) // Bottom right corner.
        gradientLayer.shouldRasterize = true
        if self.layerInit == false {
            bgGradientView.layer.insertSublayer(gradientLayer, at:0)
            self.oldLayer = gradientLayer
            self.layerInit = true
        } else {
            bgGradientView.layer.replaceSublayer(self.oldLayer!, with: gradientLayer)
            self.oldLayer = gradientLayer
        }
    }
    
    func brighten(_ givenColor: UIColor, _ coeff: Double) -> UIColor {
        var rgba = Array(repeating: CGFloat(0), count: 4)
        let CGCoeff = CGFloat(coeff)
        (rgba[0], rgba[1], rgba[2], rgba[3]) = givenColor.rgba
        for ii in 0...2 {
            rgba[ii] *= CGCoeff
        }
        return UIColor(red: rgba[0], green: rgba[1], blue: rgba[2], alpha: rgba[3])
    }
    
    @IBAction func goBack() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func playPauseToggle() {
        if myflow.musicPlayer.playbackState == .playing {
            myflow.musicPlayer.pause()
            playBtn.setTitle("▶︎", for: .normal)
        } else {
            myflow.musicPlayer.play()
            playBtn.setTitle("॥", for: .normal)
        }        
    }
    
    @IBAction func next() {
        myflow.musicPlayer.skipToNextItem()
    }
    
    @IBAction func previous() {
        if myflow.musicPlayer.currentPlaybackTime < 2 {
            myflow.musicPlayer.skipToPreviousItem()
        } else {
            myflow.musicPlayer.skipToBeginning()
        }
    }
    
    @IBAction func toggleLyricsMode() {
        self.lyricsMode = !self.lyricsMode
        if lyricsMode {
            lyricsBtn.setTitleColor(UIColor.systemYellow, for: .normal)
        }
        else {
            lyricsBtn.setTitleColor(UIColor.white, for: .normal)
        }
        self.showLyrics()
    }
    
    func showLyrics() {
        switch (self.lyricsMode, self.lyricsAvailable) {
        case (true, true):
            self.lyricsTextView.isHidden = false
        default:
            self.lyricsTextView.isHidden = true
        }
    }
}

extension UIImage {
    var averageColor: UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull as Any])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }
}

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue, alpha)
    }
}
