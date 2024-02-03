//
//  MyBunchiesView.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 2/1/24.
//
import SwiftUI

struct MyBunchiesView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("My Bunchies")
                    .font(.title)
                    .padding(.bottom, 20)

                // Your additional content for the My Bunchies view
                Text("Here's your bunchies content.")
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)

                Button(action: {
                    // Close the sheet
                }) {
                    Text("Close")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}
