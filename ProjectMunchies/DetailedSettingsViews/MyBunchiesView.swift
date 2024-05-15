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
import CoreLocation
import WeatherKit

struct Article: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let link: String
}

struct WeatherData: Identifiable {
    let id = UUID()
    let date: Date
    let iconName: String
    let temperature: Int
}

struct WeatherResponse: Codable {
    let properties: WeatherProperties
}

struct WeatherProperties: Codable {
    let periods: [WeatherPeriod]
}

struct WeatherPeriod: Codable {
    let startTime: Date
    let icon: String
    let temperature: Int
    
    enum CodingKeys: String, CodingKey {
        case startTime
        case icon
        case temperature
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var userLocation: CLLocation?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        userLocation = location
    }
}

struct MyBunchiesView: View {
    @State private var articles: [Article] = []
    @State private var isSettingsPresented = false
    @State private var selectedView: Int?
    @State private var userRating: Int?
    @State private var activeContacts: [String] = []
    @State private var weatherData: [WeatherData] = []
    @StateObject private var locationManager = LocationManager()
    @StateObject private var reviewsViewModel = ReviewsViewModel()
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Bunchies")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Spacer()
               
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
                
                HStack(spacing: 10) {
                    ForEach(weatherData) { data in
                        VStack {
                            AsyncImage(url: URL(string: data.iconName)) { phase in
                                switch phase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                                case .failure:
                                    Image(systemName: "sun.max")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                                case .empty:
                                    ProgressView()
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            Text("\(data.temperature)°")
                                .font(.caption)
                        }
                    }
                }
                .padding(.horizontal)
                
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
            
            // Submitted Reviews
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(reviewsViewModel.submittedReviews) { review in
                    VStack(alignment: .leading) {
                        Text(review.title)
                            .font(.headline)
                        Text(review.body)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
            }
            .padding()
            
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
                        .frame(width: 300)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
        .onAppear {
            fetchNews()
            
        }
        .onChange(of: locationManager.userLocation) { _ in
            fetchWeatherData()
        }
    }
    
    func fetchNews() {
        guard let url = URL(string: "https://www.fns.usda.gov/rss-feeds/newsroom") else { return }
        let parser = XMLParser(contentsOf: url)
        let delegate = XMLParserDelegateImpl()
        parser?.delegate = delegate
        parser?.parse()
        articles = delegate.articles
    }
    
    func fetchWeatherData() {
        guard let location = locationManager.userLocation else { return }
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        guard let url = URL(string: "https://api.weather.gov/points/\(latitude),\(longitude)/forecast") else {
            // Handle the case when the URL creation fails
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let weatherResponse = try? decoder.decode(WeatherResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.weatherData = weatherResponse.properties.periods.prefix(7).map { period in
                            WeatherData(date: period.startTime, iconName: self.getIconName(from: period.icon), temperature: period.temperature)
                        }
                        print("Weather Data: \(self.weatherData)")
                    }
                }
            }
        }.resume()
    }
    
    func getIconName(from iconName: String) -> String {
        let baseURL = "https://api.weather.gov/icons/land/day"
        let iconURL = "\(baseURL)/\(iconName)?size=medium"
        return iconURL
    }
    
    @ViewBuilder
    func profileIcon() -> some View {
        Menu {
            Button(action: {
                selectedView = 0
                isSettingsPresented = true
            }) {
                Label("My Bunchies", systemImage: "person.2.square.stack")
            }
            
            Button(action: {
                selectedView = 2
                isSettingsPresented = true
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
        .sheet(isPresented: $isSettingsPresented) {
            switch selectedView {
            case 0:
                MyBunchiesView()
            case 2:
                SettingsView()
            default:
                EmptyView()
            }
        }
    }
    
    
    
    struct ContactItem: View {
        let contactName: String
        
        var body: some View {
            VStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text(contactName)
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
    
    struct MyBunchiesView_Previews: PreviewProvider {
        static var previews: some View {
            MyBunchiesView()
        }
    }
}
