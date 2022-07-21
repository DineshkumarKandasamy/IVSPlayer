//
//  IVSPlayerViewController.swift
//  IVSPlayer
//
//  Created by Dineshkumar Kandasamy on 13/07/22.
//

import UIKit

class IVSPlayerViewController: UIViewController {
    
    // MARK: - Properties
    
    private weak var tableView: UITableView!

    private let videosURLArray = [URL(string: "https://77e7e7b07738.us-west-2.playback.live-video.net/api/video/v1/us-west-2.262021823787.channel.ldJ2kUqtouBL.m3u8")!,
                                  URL(string: "http://52.73.59.152:1935/livesteaming/home/playlist.m3u8")!]
    
    // MARK: - Lifecycle
    
    // Custom initializers go here
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
         
        setupViews()
        
    }
    
    // MARK: - View will appear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Network requests
    
    // MARK: - Private methods
    
    func playVideo(url videoURL: URL) {
        
        
         
        
    }
    
    // MARK: - User interactions
    
    // MARK: - UI and constraints methods
    
    private func setupViews() {
        
        
        let tableviewItem = UITableView.init(frame: CGRect.zero, style: .plain)
        tableviewItem.translatesAutoresizingMaskIntoConstraints = false
        tableviewItem.dataSource = self
        tableviewItem.delegate = self
        
        tableviewItem.backgroundColor = .clear
        tableviewItem.separatorStyle = .none
        tableviewItem.contentInsetAdjustmentBehavior = .never
        //tableviewItem.isHidden = true
        
        tableviewItem.register(IVSPlayerTableViewCell.self, forCellReuseIdentifier: IVSPlayerTableViewCell.reuseIdentifier)
        
        self.tableView = tableviewItem
        view.addSubview(tableviewItem)
        
        setupConstraints()
        
//        guard let url = URL(string: "http://52.73.59.152:1935/livesteaming/home/playlist.m3u8") else {
//            return
//        }
//
//        playVideo(url: url)
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
    }
    
    // MARK: - ViewWillLayoutSubviews
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
}


// MARK: - HomeNotesViewController - UITableViewDelegate, UITableViewDataSource

extension IVSPlayerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videosURLArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: IVSPlayerTableViewCell.reuseIdentifier, for: indexPath) as! IVSPlayerTableViewCell
        cell.playVideo(url: videosURLArray[indexPath.row])
//        cell.delegate = self
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DEVICE.SCREENHEIGHT
    } 
    
}


extension UITableViewCell {

        /// Returns an identifier for reuse the ui element tableview cell
        static var reuseIdentifier: String! {
                let className = String(describing: self)
                return className
        }
}
