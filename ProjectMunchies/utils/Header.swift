//
//  Header.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 8/12/23.
//

import SwiftUI

struct Header: View {
    @State private var showPrefPopover: Bool = false
    @State private var showIntroPopover: Bool = false
    @State private var selectedView: ViewSelection?
    @Binding var profileImage: UIImage

    var body: some View {
        GeometryReader { geoReader in
            ZStack {
                HStack {
                    Spacer()
                    logoWithText(for: geoReader)
                    Spacer()
                    profileIcon(for: geoReader)
                    Spacer()
                }
            }
        }
    }

    func logoWithText(for geoReader: GeometryProxy) -> some View {
        HStack {
            ZStack {
                Image("crunchBunchAppIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geoReader.size.width * 0.14, height: geoReader.size.height * 0.14)
                    .position(x: geoReader.size.width * 0.04, y: geoReader.size.height * 0.5)
                Image("crunchBunchText")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geoReader.size.width * 0.4, height: geoReader.size.height * 0.4)
                    .position(x: geoReader.size.width * 0.3, y: geoReader.size.height * 0.51)
            }
        }
    }

    func profileIcon(for geoReader: GeometryProxy) -> some View {
        VStack {
            Button(action: {
                selectedView = .myBunchies
            }) {
                if profileImage.size.width > 0 {
                    Image(uiImage: profileImage)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .sheet(item: $selectedView) { selectedView in
                switch selectedView {
                case .myBunchies:
                    MyBunchiesView(profileImage: $profileImage)
                        .ignoresSafeArea()
                        .background(SheetBackgroundView())
                }
            }
        }
    }

    enum ViewSelection: Identifiable {
        case myBunchies

        var id: Int {
            hashValue
        }
    }
}
