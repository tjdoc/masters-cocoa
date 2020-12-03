//
//  ViewController.swift
//  Flow Playlist
//
//  Created by Tae-Jin Oh on 2020/11/30.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var myflow = Flow()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myflow.getAuthorization()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.myflow.audioCategory.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.myflow.audioCategory[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.myflow.sectionIdx = indexPath.section
        self.myflow.itemIdx = indexPath.row
        let MusicVc = storyboard?.instantiateViewController(identifier: "musicVC") as! MusicViewController
        MusicVc.myflow = self.myflow
        MusicVc.modalPresentationStyle = .fullScreen
        present(MusicVc, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myflow.mydic[section]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        switch (indexPath.section, indexPath.row) {
        case (0, _):
            cell.textLabel!.text = self.myflow.mydic[indexPath.section]![indexPath.row].value(forProperty: MPMediaPlaylistPropertyName) as? String
        case (1, _):
            cell.textLabel!.text = self.myflow.mydic[indexPath.section]![indexPath.row].representativeItem!.genre!
        case (2, _):
            cell.textLabel!.text = self.myflow.mydic[indexPath.section]![indexPath.row].representativeItem!.artist!
        case (3, _):
            cell.textLabel!.text = self.myflow.mydic[indexPath.section]![indexPath.row].representativeItem!.albumTitle!
        default:
            cell.textLabel!.text = "??"
        }
        return cell
    }
}

