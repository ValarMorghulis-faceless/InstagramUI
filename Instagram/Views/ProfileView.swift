//
//  ProfileView.swift
//  Instagram
//
//  Created by Giorgi Samkharadze on 13.11.22.
//

import SwiftUI

struct ProfileView: View {
    var columns: [GridItem] = [
        GridItem(.fixed(150)),
        GridItem(.fixed(150)),
        GridItem(.fixed(150))
    ]
    var body: some View {
        NavigationView {
                ScrollView {
                    profileHeaderView()
                        .padding()
                    LazyVGrid(columns: columns,spacing: 1, content:  {
                        ForEach(0...3, id: \.self) { num in
                            let imageName = "Image-\(Int.random(in: 1...4))"
                            NavigationLink(destination: PostView(userImageName: "User1-2", imageName: imageName).navigationBarTitle("Photo", displayMode: .inline), label: {
                                Image(imageName)
                                    .resizable()
                                    .frame(width: 150, height: 150, alignment: .center)
                                    .aspectRatio(contentMode: .fill)
                            })
                        }
                    })
                }
                .padding()
            
            .navigationBarTitle("Samkharag", displayMode: .inline)
        }
    }
}

struct profileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            // avatar image, counts
            HStack {
                Image("User1-2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(50)
                    .padding()
                VStack {
                   HeaderCountButtonsView()
                    // edit profile button
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Edit Profile")
                            .foregroundColor(Color(.label))
                            .frame(width: 250, height: 35, alignment: .center)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(8)
                    })
                    
                }
            }
            // user bio
            HStack {
                Text("I dont do drugs, I am The drugs")
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 20)
                    .padding()
                Spacer()
            }
            
        }
    }
}

struct HeaderCountButtonsView: View {
    var body: some View {
        HStack {
            // poists, followers, following
            Button(action: {
            }, label: {
                Text("3\nPosts")
                    .foregroundColor(Color(.label))
                    .multilineTextAlignment(.center)
            })
            .frame(width: 50, height: 50, alignment: .center)
            Button(action: {
            }, label: {
                Text("455\nFollowers")
                    .foregroundColor(Color(.label))
                    .multilineTextAlignment(.center)
            })
            .frame(width: 80, height: 50, alignment: .center)
            .padding()
            Button(action: {
            }, label: {
                Text("230\nFollowing")
                    .foregroundColor(Color(.label))
                    .multilineTextAlignment(.center)
            })
            .frame(width: 80, height: 50, alignment: .center)
            .padding()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.dark)
    }
}
