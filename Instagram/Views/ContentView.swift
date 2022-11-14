//
//  ContentView.swift
//  Instagram
//
//  Created by Giorgi Samkharadze on 13.11.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeFeedView()
                .tabItem {
                    Image(systemName: "house")
                    
                    Text("Home")
                }
            ExploreView()
                .tabItem {
                    Image(systemName: "safari")
                    
                    Text("Explore")
                    
                }
            CameraView()
                .tabItem {
                    Image(systemName: "camera")
                    
                    Text("Camera")
                    
                }
            NotificationView()
                .tabItem {
                    Image(systemName: "bell")
                    
                    Text("Notification")
                    
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    
                    Text("Profile")
                    
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
