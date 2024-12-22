//
//  LoopingVIdeoPlayerView.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 9/8/24.
//

import AVKit
import SwiftUI

struct LoopingVideoPlayer: View {
    private var player: AVQueuePlayer
    private var playerLooper: AVPlayerLooper
    
    var body: some View {
        VideoPlayer(player: player)
            .onAppear { player.play() }
            .onDisappear{ player.pause() }
    }
    
    init(videoURL: URL) {
        let asset = AVAsset(url: videoURL)
        let item = AVPlayerItem(asset: asset)
        
        player = AVQueuePlayer(playerItem: item)
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
    }
}

#Preview {
    LoopingVideoPlayer(videoURL: URL(string: "https://www.apple.com/105/media/us/airpods/2022/dc1310af-8cb9-4218-8d40-26bbe6a1d307/anim/hero/large_2x.mp4")!)
        .disabled(true) // Hides iOS video controls
        .aspectRatio(contentMode: .fill)
        .frame(maxWidth: .infinity)
}
