//
//  ExploreView.swift
//  Instagram
//
//  Created by Giorgi Samkharadze on 13.11.22.
//

import SwiftUI

struct ExploreView: View {
    
    @State var text = ""
    
    var imageNames = (1...4).map {"Image-\($0)"}
    
    var columns: [GridItem] = [
        GridItem(.flexible(minimum: 200)),
        GridItem(.flexible(minimum: 200))
    ]
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    TextField("Search...", text: $text)
                        .padding(10)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(12)
                        .padding()
                    LazyVGrid(columns: columns, content:  {
                        ForEach(0...20, id: \.self) { num in
                            let name = imageNames.randomElement() ?? "Image-1"
                            NavigationLink(destination: PostView(userImageName: "User1-1", imageName: name), label: {
                                Image(name)
                                    .resizable()
                                    .frame(width: 200, height: 200, alignment: .center)
                                    .aspectRatio(contentMode: .fill)
                            })
                        }
                    })
                }
        

            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .preferredColorScheme(.dark)
    }
}
