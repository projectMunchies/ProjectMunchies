//
//  MyBunchiesView.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 2/1/24.
//
import SwiftUI
import Contacts
import ContactsUI
import MessageUI



struct Article: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let link: String
}

struct MyBunchiesView: View {
    
    
    
    @State private var articles: [Article] = []
    @State private var isSettingsPresented = false
    @State private var selectedView: Int?
    
    @State private var userRating: Int?
    @State private var activeContacts: [String] = []
    var body: some View {
           VStack(spacing: 20) {
               HStack {
                   Text("Bunchies")
                       .font(.title)
                       .fontWeight(.bold)
                       .foregroundColor(.primary)
                   Spacer()
                   profileIcon()
                   NavigationLink(destination: MessagingView()) {
                       Image(systemName: "message.circle")
                           .resizable()
                           .frame(width: 30, height: 30)
                           .foregroundColor(.black)
                   }
                   .padding(.trailing, 10)
               }
               .padding(.horizontal)
               .padding(.top, 15)
           
               VStack(alignment: .leading) {
                             HStack {
                                 ForEach(1...5, id: \.self) { index in
                                     Image(systemName: index <= (userRating ?? 0) ? "star.fill" : "star")
                                         .foregroundColor(.yellow)
                                         .onTapGesture {
                                             self.userRating = index
                                         }
                                 }
                             }
                             .padding(.horizontal)
                             .padding(.top, 8)
                             
                             Spacer()
                         }
                         
               // Active users
                          ScrollView(.horizontal, showsIndicators: false) {
                              HStack(spacing: 10) {
                                  ForEach(activeContacts, id: \.self) { contact in
                                      ContactItem(contactName: contact)
                                  }
                              }
                              .padding(.horizontal)
                          }
                          
                          Spacer()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(articles) { article in
                        VStack(alignment: .leading) {
                            Text(article.title)
                                .font(.headline)
                            Text(article.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(2)
                            Link("Read more", destination: URL(string: article.link)!)
                        }
                        .frame(width: 300) // Adjust width as needed
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
        .onAppear(perform: fetchNews)
    }

    func fetchNews() {
        guard let url = URL(string: "https://www.fns.usda.gov/rss-feeds/newsroom") else { return }
        let parser = XMLParser(contentsOf: url)
        let delegate = XMLParserDelegateImpl()
        parser?.delegate = delegate
        parser?.parse()
        articles = delegate.articles
    }
}


struct ContactItem: View {
    let contactName: String // Accept contact name as parameter

    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 50, height: 50)
            Text(contactName) // Display contact name
                .font(.caption)
                .multilineTextAlignment(.center)
        }
        .padding(10)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}

class XMLParserDelegateImpl: NSObject, XMLParserDelegate {
    var articles: [Article] = []
    private var currentElement: String = ""
    private var currentTitle: String = ""
    private var currentDescription: String = ""
    private var currentLink: String = ""
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "title":
            currentTitle += string
        case "description":
            currentDescription += string
        case "link":
            currentLink += string
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            articles.append(Article(title: currentTitle, description: currentDescription, link: currentLink))
            currentTitle = ""
            currentDescription = ""
            currentLink = ""
        }
    }
}

extension MyBunchiesView {
    @ViewBuilder
    func profileIcon() -> some View {
        Menu {
            Button(action: {
                selectedView = 0
            }) {
                Label("My Bunchies", systemImage: "person.2.square.stack")
            }

            Button(action: {
                selectedView = 1
            }) {
                Label("My Reviews", systemImage: "star.fill")
            }

            Button(action: {
                selectedView = 2
            }) {
                Label("Settings", systemImage: "gearshape.fill")
            }
        } label: {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.black)
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .onChange(of: selectedView) { newValue in
            isSettingsPresented = true // Set this to true for all views
        }
        .sheet(isPresented: $isSettingsPresented) {
            NavigationView {
                if let selectedView = selectedView {
                    switch selectedView {
                    case 0:
                        MyBunchiesView()
                    case 1:
                        MyReviewsView()
                    case 2:
                        SettingsView()
                    default:
                        EmptyView()
                    }
                }
            }
        }
    }
}

struct MyBunchiesView_Previews: PreviewProvider {
    static var previews: some View {
        MyBunchiesView()
    }
}
