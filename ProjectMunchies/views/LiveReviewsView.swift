//
//  MyReviewsIView.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 2/3/24.
//
import SwiftUI

struct LiveReviewsView: View {
    @State private var selectedTab: LiveReviewTabsModel?
    @State private var tabProgress: CGFloat = 0.5
    @State private var isExpanded: Bool = false
    
    var body: some View {
            VStack {
                
                Button(action: {
                    
                }){
                    ZStack{
                        Text("")
                            .frame(width: 350, height: 60)
                            .background(.blue)
                            .cornerRadius(30)
                        
                        Text("Add New Review")
                            .bold()
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                    }
                }
                .padding()
                
                CustomTabBar()

                GeometryReader {
                    let size = $0.size
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 0) {
                            SampleView(.purple)
                                .id(LiveReviewTabsModel.recent)
                                .containerRelativeFrame(.horizontal)
                            
                            SampleView(.red)
                                .id(LiveReviewTabsModel.top)
                                .containerRelativeFrame(.horizontal)
                            
                            SampleView(.blue)
                                .id(LiveReviewTabsModel.popular)
                                .containerRelativeFrame(.horizontal)
                        }
                        .scrollTargetLayout()
                        .offsetX { value in
                            /// Converting Offset into Progress
                            let progress = -value / (size.width * CGFloat(LiveReviewTabsModel.allCases.count - 1))
                            
                            /// Capping Progress BTW 0-1
                            tabProgress = max(min(progress, 1), 0)
                        }
                    }
                    .scrollPosition(id: $selectedTab)
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.paging)
                    .scrollClipDisabled()
                }
               .frame(height: self.isExpanded ? 200 : 400)
            }
          //  .padding()
    }
    
    private func CustomTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(LiveReviewTabsModel.allCases, id: \.rawValue) { tab in
                HStack(spacing: 10) {
                    Image(systemName: tab.systemImage)
                    
                    Text(tab.rawValue)
                        .font(.callout)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .contentShape(.capsule)
                .onTapGesture {
                    /// Updating Tab
                    withAnimation(.snappy) {
                        selectedTab = tab
                    }
                }
            }
        }
        /// Scrollable Active Tab Indicator
        .background {
            GeometryReader {
                let size = $0.size
                let capsuleWidth = size.width / CGFloat(LiveReviewTabsModel.allCases.count)
                
                Capsule()
                    .fill(.blue)
                    .frame(width: capsuleWidth)
                    .offset(x: tabProgress * (size.width - capsuleWidth))
            }
        }
        .padding(.horizontal, 15)
    }
    
    private func SampleView(_ color: Color) -> some View {
        GeometryReader{ proxy in
            AutoScrollView(color: color, items: liveReviewSamples)
        }
    }
}

#Preview {
    LiveReviewsView()
}
