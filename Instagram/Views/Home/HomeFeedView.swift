//
//  HomeFeedView.swift
//  Instagram
//
//  Created by Giorgi Samkharadze on 13.11.22.
//

import SwiftUI

struct HomeFeedView: View {
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    StoriesView()
                        .padding(7)
                    ForEach(1...4, id: \.self) {num in
                        PostView(userImageName: "User1-\(num)", imageName: "Image-\(num)")
                            .padding(.bottom, 20)
                    }
                }
            }
            .navigationTitle("Instagram")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PostView: View {
    let userImageName: String
    let imageName: String
    var body: some View {
        VStack {
            PostHeaderView(userImageName: userImageName)
            .padding()
            
            //Image
            Image(imageName)
                .resizable()
                .frame(width: 430, height: 430, alignment: .center)
                .aspectRatio(contentMode: .fill)
                .background(Color(.secondarySystemBackground))
            PostActionButtonsView()
            HStack {
                //Like Count
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(Color.red)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: .center)
                Text("2,323 Likes")
                    .font(.system(size: 20))
                    .foregroundColor(Color(.link))
                Spacer()
            }
            .padding()
            .padding(.top, -20)
            //Caption
            HStack {
                Text("ra tito guli chemi dedasheveci ❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️")
                    .font(.headline)
                    .padding(.top, -15)
                Spacer()
            }
            .padding(.leading, 17)
            
            //Comments
            
            // Date
            HStack {
                Text("1 hour ago")
                    .foregroundColor(Color(.secondaryLabel))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(.leading, 15)
        }
    }
}

struct PostActionButtonsView: View {
    var body: some View {
        HStack {
            //Action buttons: like, comment, share
            Button(action: {
                
            }, label: {
                Image(systemName: "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(Color(.label))
            })
            .padding(.trailing, 10)
            Button(action: {
                
            }, label: {
                Image(systemName: "message")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(Color(.label))
            })
            .padding(.trailing, 10)
            Button(action: {
                
            }, label: {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(Color(.label))
            })
            .padding(.trailing, 10)
            Spacer()
        }
        .padding()
    }
}

struct PostHeaderView: View {
    var userImageName: String
    var body: some View {
        HStack {
            // User profile picture and username
            Image(userImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20)
            Text ("samkharag")
                .bold()
            Spacer()
        }
    }
}

struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView()
            .preferredColorScheme(.dark)
    }
}
