//
//  IVSPlayerTableViewCell.swift
//  IVSPlayer
//
//  Created by Dineshkumar Kandasamy on 15/07/22.
//

import UIKit
import AmazonIVSPlayer

class IVSPlayerTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private weak var playerView: IVSPlayerView!
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .red
        
        self.selectionStyle = .none
        
        setupViews()
        
    }
    
    
    // MARK: - Public methods
        
    // MARK: - Private methods
    
    func playVideo(url videoURL: URL) {
        
        let player = IVSPlayer()
        player.delegate = self
        playerView.player = player
        playerView.playerLayer.videoGravity = .resizeAspectFill
        player.load(videoURL)
        
    }
    
    
    // MARK: - UI and Constraints methods
    
    private func setupViews() {
        
        let playerViewItem = IVSPlayerView()
        playerViewItem.translatesAutoresizingMaskIntoConstraints = false
        self.playerView = playerViewItem
        contentView.addSubview(playerViewItem)
        
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            playerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            playerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            playerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            playerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
        
    }
    
    // MARK: - LayoutSubviews
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension IVSPlayerTableViewCell: IVSPlayer.Delegate {
    func player(_ player: IVSPlayer, didChangeState state: IVSPlayer.State) {
        if state == .ready {
            player.play()
        }
    }
}

// MARK: - DEVICE DETAILS

/// Calculating the screen width and height
enum DEVICE {
    
    static let SCREENWIDTH = UIScreen.main.bounds.size.width
    static let SCREENHEIGHT = UIScreen.main.bounds.size.height
    
}
