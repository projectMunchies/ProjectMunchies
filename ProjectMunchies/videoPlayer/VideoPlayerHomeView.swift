//
//  VideoPlayerHomeVIew.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 11/14/23.
//

import SwiftUI
import AVKit
import YouTubePlayerKit

struct VideoPlayerHomeView: View {
    @State var showOverlay: Bool
    @State private var rating: Int = 0
    
    @State var data = [
        Video(id: 0, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "exampleMp4", ofType: "mp4")!)), replay: false, youtubePlayer: "https://www.youtube.com/shorts/rltZSyJ1CQ8"),
        Video(id: 1, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "exampleMp4", ofType: "mp4")!)), replay: false, youtubePlayer: "https://www.youtube.com/shorts/Z9tlfHghsBo"),
        Video(id: 2, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "exampleMp4", ofType: "mp4")!)), replay: false, youtubePlayer: "https://www.youtube.com/shorts/3POLWRO9ZL8"),
    ]
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            VStack{
                PlayerScrollView(data:self.$data)
            }
            .onTapGesture {
                showOverlay.toggle()
            }
            .overlay {
                if showOverlay {
                    ZStack{
                        Rectangle() // the semi-transparent overlay
                                                   .foregroundColor(Color.black.opacity(0.5))
                                                   .edgesIgnoringSafeArea(.all)
                        
                        Text("")
                            .frame(width: 350, height: 200)
                            .background(.white)
                            .cornerRadius(30)
                        RatingView(rating: self.$rating)
                    }
                    .onTapGesture {
                        showOverlay.toggle()
                    }
                }
            }
            .ignoresSafeArea()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}

struct VideoPlayerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerHomeView(showOverlay: false)
    }
}

struct PlayerView: View {
    @Binding var data : [Video]
    
    var body: some View{
        VStack(spacing: 0){
            ForEach(self.data) { i in
                YouTubePlayerView(i.youtubePlayer)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .offset(y: -5)
                    .disabled(true)
                    .onAppear{
                        i.youtubePlayer.configuration = .init(
                            autoPlay: true,
                            showControls: false,
                            loopEnabled: true
                        )
                    }
                .edgesIgnoringSafeArea(.all)            }
        }
        .onAppear{
            self.data[0].youtubePlayer.play()
        }
    }
}

struct Player : UIViewControllerRepresentable {
    var player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let view = AVPlayerViewController()
        view.player = player
        view.showsPlaybackControls = false
        view.videoGravity = .resizeAspectFill
        return view
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
    }
}

class Host: UIHostingController<ContentView>{
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}

struct Video: Identifiable {
    var id: Int
    var player: AVPlayer
    var replay: Bool
    var youtubePlayer: YouTubePlayer
}

struct PlayerScrollView: UIViewRepresentable {
    @Binding var data: [Video]
    
    func makeCoordinator() -> Coordinator {
        return PlayerScrollView.Coordinator(parent1: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let view = UIScrollView()
        let childView = UIHostingController(rootView: PlayerView(data: self.$data))
        
        childView.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        
        view.addSubview(childView.view)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        
        view.contentInsetAdjustmentBehavior = .never
        view.isPagingEnabled = true
        view.delegate = context.coordinator
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        uiView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        
        for i in 0..<uiView.subviews.count{
            uiView.subviews[i].frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        }
    }
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        var parent: PlayerScrollView
        var index = 0
        
        init(parent1: PlayerScrollView) {
            parent = parent1
        }
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let currentIndex = Int(scrollView.contentOffset.y / UIScreen.main.bounds.height)
            
            if index != currentIndex{
                index = currentIndex
                
                for i in 0..<parent.data.count{
                    parent.data[i].youtubePlayer.seek(to: .zero, allowSeekAhead: true)
                    parent.data[i].youtubePlayer.pause()
                }
                
                parent.data[index].youtubePlayer.play()
            }
        }
    }
}
