//
//  VideoModel.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 1/17/24.
//

import Foundation
import AVKit
import YouTubePlayerKit

struct Video: Identifiable {
    var id: Int
    var player: AVPlayer
    var replay: Bool
    var youtubePlayer: YouTubePlayer
}



var sampleVideos = [
    Video(id: 0, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "exampleMp4", ofType: "mp4")!)), replay: false, youtubePlayer: "https://www.youtube.com/shorts/Z9tlfHghsBo"),
    Video(id: 1, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "exampleMp4", ofType: "mp4")!)), replay: false, youtubePlayer: "https://www.youtube.com/shorts/rltZSyJ1CQ8"),
    Video(id: 2, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "exampleMp4", ofType: "mp4")!)), replay: false, youtubePlayer: "https://www.youtube.com/shorts/3POLWRO9ZL8"),
    Video(id: 3, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "exampleMp4", ofType: "mp4")!)), replay: false, youtubePlayer: "https://www.youtube.com/shorts/rltZSyJ1CQ8"),
]
