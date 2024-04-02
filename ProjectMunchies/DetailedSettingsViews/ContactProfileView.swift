//
//  ContactProfileView.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 2/21/24.
//

import SwiftUI
import Contacts

struct ContactProfileView: View {
    let contact: CNContact
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        GeometryReader { geoReader in
            ZStack {
                Color.white
                    .ignoresSafeArea()

                VStack {
                    imageSection(for: geoReader)
                    Spacer()
                        .frame(height: geoReader.size.height * 0.08)
                    mainButtons(for: geoReader)
                }
                .position(x: geoReader.frame(in: .local).midX, y: geoReader.size.height * 0.5)
            }
            .navigationBarTitle(contact.fullName, displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
        }
    }

    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                Text("Back")
            }
        }
    }

    private func imageSection(for geoReader: GeometryProxy) -> some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 250, height: 250)
                .background(Color.black.opacity(0.2))
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
        }
    }

    private func mainButtons(for geoReader: GeometryProxy) -> some View {
        VStack {
            Button(action: {}) {
                Text("Reviews")
                    .foregroundColor(.white)
                    .frame(width: geoReader.size.width * 0.8, height: geoReader.size.height * 0.08)
                    .background(Color.gray)
                    .cornerRadius(geoReader.size.width * 0.06)
            }

            Button(action: {}) {
                Text("Bunchies")
                    .frame(width: geoReader.size.width * 0.8, height: geoReader.size.height * 0.08)
                    .background(Color.gray)
                    .cornerRadius(geoReader.size.width * 0.06)
                    .foregroundColor(.white)
            }

            Button(action: {}) {
                Text("Similarities")
                    .frame(width: geoReader.size.width * 0.8, height: geoReader.size.height * 0.08)
                    .background(Color.gray)
                    .cornerRadius(geoReader.size.width * 0.06)
                    .foregroundColor(.white)
            }
        }
    }
}

extension CNContact {
    var fullName: String {
        "\(givenName) \(familyName)"
    }
}

struct ContactProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let contact = CNContact()
        contact.setValue("John", forKey: "givenName")
        contact.setValue("Doe", forKey: "familyName")
        return ContactProfileView(contact: contact)
    }
}
