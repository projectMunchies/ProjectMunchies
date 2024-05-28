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
    
    @State var data = sampleVideos
    
    var body: some View {
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
        .background(Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct VideoPlayerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerHomeView(showOverlay: false)
    }
}

struct PlayerView: View {
    @Binding var data : [Video]
    @State var startBullshit: Bool = false
    
    var body: some View{
        GeometryReader{ geoReader in
            VStack(spacing: 0){
                ForEach(self.data) { i in
                    // Player(player: i.youtubePlayer)
                    YouTubePlayerView(i.youtubePlayer)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .offset(y: -5)
                        .disabled(true)
                }
            }
            .onAppear{
                //not sure why the first video isn't working in the foreach above...
                // be we need to launch it manually
                self.data[0].youtubePlayer.configuration = .init(
                    autoPlay: true,
                    showControls: false,
                    loopEnabled: true
                )
                self.data[0].youtubePlayer.play()
            }
        }
    }
}

struct Player : UIViewControllerRepresentable {
    var player: YouTubePlayer
    
    func makeUIViewController(context: Context) -> YouTubePlayerViewController {
        let  view = YouTubePlayerViewController(
            player: player
        )
        
        return view
    }
    
    func updateUIViewController(_ uiViewController: YouTubePlayerViewController, context: Context) {
    }
}

class Host: UIHostingController<ContentView>{
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}

struct PlayerScrollView: UIViewRepresentable {
    @Binding var data: [Video]
    
    func makeCoordinator() -> Coordinator {
        return PlayerScrollView.Coordinator(parent1: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let view = UIScrollView()
        let childView = UIHostingController(rootView: PlayerView(data: self.$data))
        
        //each children occupies one full screen so height = count * height of screen...
        childView.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        
        view.addSubview(childView.view)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = true
        view.delegate = context.coordinator
        
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        // to dynamically update height based on data
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
                    //pausing all other videos
                    parent.data[i].youtubePlayer.seek(to: .zero, allowSeekAhead: true)
                    parent.data[i].youtubePlayer.pause()
                }
                
                //playing next video
                parent.data[index].youtubePlayer.play()
            }
        }
    }
}
