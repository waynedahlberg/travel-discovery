//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Wayne Dahlberg on 11/25/20.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      ScrollView {
        
        DiscoverCategoriesView()
        
        PopularDestinationsView()
        
        PopularRestaurantsView()
        
        TrendingCreatorsView()
        
      }.navigationTitle("Discover")
    }
  }
}

struct Category: Hashable {
  let name, imageName: String
}

struct Restaurant: Hashable {
  let name, imageName: String
}

struct Creator: Hashable {
  let name, imageName: String
}

struct Destination: Hashable {
  let name, country, imageName: String
}

struct PopularDestinationsView: View {
  
  let destinations: [Destination] = [
    .init(name: "Paris", country: "France", imageName: "eiffel_tower"),
    .init(name: "Tokyo", country: "Japan", imageName: "japan"),
    .init(name: "New York", country: "NY, USA", imageName: "new_york"),
  ]
  
  var body: some View {
    HStack {
      Text("Popular Destinations")
        .font(.system(size: 14, weight: .semibold))
      Spacer()
      Text("See All")
        .font(.system(size: 14, weight: .semibold))

    }
    .padding(.horizontal)
    .padding(.top)
    
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 10) {
        ForEach(destinations, id:\.self) { destination in
          VStack(alignment: .leading, spacing: 0) {
            
            Image(destination.imageName)
              .resizable()
              .scaledToFill()
              .frame(width: 125, height: 125)
              .cornerRadius(3)
              .padding(.horizontal, 8)
              .padding(.vertical, 8)
            
            Text(destination.name)
              .font(.system(size: 14, weight: .semibold))
              .padding(.horizontal, 12)
            Text(destination.country)
              .font(.system(size: 14, weight: .semibold))
              .padding(.horizontal, 12)
              .padding(.bottom, 8)
          }
            //.frame(width: 125)
            .background(Color.init(white: 0.9))
            .cornerRadius(5)
          .shadow(color: Color.gray.opacity(0.75), radius: 4, x: 0.0, y: 8)
            .padding(.bottom)
        }
      }.padding(.horizontal)
    }
  }
}

struct PopularRestaurantsView: View {
  
  let restaurants: [Restaurant] = [
    .init(name: "Japan's Finest Tapas", imageName: "tapas"),
    .init(name: "Bar & Grill", imageName: "bar_grill"),
  ]
  var body: some View {
    HStack {
      Text("Popular places to eat")
        .font(.system(size: 14, weight: .semibold))
      Spacer()
      Text("See All")
        .font(.system(size: 14, weight: .semibold))

    }
    .padding(.horizontal)
    .padding(.top)
    
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 8.0) {
        ForEach(restaurants, id:\.self) { restaurant in
          HStack(spacing: 8) {
            Image(restaurant.imageName)
              .resizable()
              .scaledToFill()
              .frame(width: 60, height: 60)
              .clipped()
              .cornerRadius(5)
              .padding(.leading, 6)
              .padding(.vertical, 6)
            
            VStack(alignment: .leading, spacing: 4) {
              HStack {
                Text(restaurant.name)
                Spacer()
                Button(action: {}, label: {
                  Image(systemName: "ellipsis")
                })
              }
              
              HStack {
                Image(systemName: "star.fill")
                Text("4.7 • Sushi • $$")
              }
              Text("Tokyo, Japan")
            }
            .font(.system(size: 12, weight: .semibold))

            
            Spacer()
          }
          .frame(width: 240)
          .background(Color(white: 0.9))
          .cornerRadius(5)
          .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
          .padding(.bottom)
        }
      }.padding(.horizontal)
    }
  }
}

struct TrendingCreatorsView: View {
  
  let creators: [Creator] = [
    .init(name: "Amy Adams", imageName: "amy"),
    .init(name: "Bill", imageName: "billy"),
    .init(name: "Sam Soffes", imageName: "sam"),
  ]
  
  var body: some View {
    HStack {
      Text("Trending Creators")
        .font(.system(size: 14, weight: .semibold))
      Spacer()
      Text("See All")
        .font(.system(size: 14, weight: .semibold))

    }
    .padding(.horizontal)
    .padding(.top)
    
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .top, spacing: 12) {
        ForEach(creators, id:\.self) { creator in
          VStack {
            Image(creator.imageName)
              .resizable()
              .scaledToFill()
              .frame(width: 60, height: 60)
              .clipShape(Circle())
              .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
            
            Text(creator.name)
              .font(.system(size: 14, weight: .semibold))
              .multilineTextAlignment(.center)

          }
          
        }
      }.padding(.horizontal)
    }
  }
}

struct DiscoverCategoriesView: View {
  
  let categories: [Category] = [
    Category(name: "Arts", imageName: "paintpalette.fill"),
    Category(name: "Sports", imageName: "sportscourt.fill"),
    Category(name: "Events", imageName: "music.mic"),
    Category(name: "Food", imageName: "lifepreserver.fill"),
    Category(name: "History", imageName: "building.columns.fill"),
  ]
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .top, spacing: 16) {
        ForEach(categories, id:\.self) { category in
          VStack(spacing: 8) {
            Image(systemName: category.imageName)
              .font(.system(size: 20))
              .imageScale(.large)
              .foregroundColor(Color.white)
              .frame(width: 68, height: 68)
              .background(Color.gray)
              .cornerRadius(68)
              .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
            Text(category.name)
              .font(.system(size: 12, weight: .semibold, design: .default))
              .multilineTextAlignment(.center)
          }.frame(width: 68)
          
        }
      }
      .padding(.horizontal)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}







