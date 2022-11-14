//
//  StoriesView.swift
//  Instagram
//
//  Created by Giorgi Samkharadze on 13.11.22.
//

import SwiftUI

struct StoriesView: View {
    let data = (1...4).map({"User1-\($0)"})
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(data, id: \.self) { ImageName in
                    StoryView(imageName: ImageName)
                }
            }
        }
    }
}

struct StoryView: View {
    let imageName : String
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 90, height: 90, alignment: .center)
            .background(Color.blue)
            .cornerRadius(45)
            .padding(3)
    }
}
