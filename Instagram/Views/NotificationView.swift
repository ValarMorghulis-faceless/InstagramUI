//
//  NotificationView.swift
//  Instagram
//
//  Created by Giorgi Samkharadze on 13.11.22.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationView {
            VStack {
                List(0...30, id: \.self) { num in
                    if num % 2 == 0 {
                        NotificationFollowView()
                    } else {
                        NotificationLikeView()
                    }
                }
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)

        }
    }
}

struct NotificationLikeView: View {
    var body: some View {
        HStack {
            // user image
            let userImageName  = "User1-\(Int.random(in: 1...4))"
            Image(userImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20)
            // text, date
            VStack(alignment: .leading) {
                Text("sandrosamkharadze liked your post.")
                Text("\(Int.random(in: 1...59)) minutes ago")
                    .foregroundColor(Color(.secondaryLabel))

            }
            Spacer()
            // Post
            let imageName = "Image-\(Int.random(in: 1...4))"
            let image = Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 44, height: 44, alignment: .center)
            NavigationLink(destination: PostView(userImageName: userImageName , imageName: imageName), label: {
                Spacer()
                image
                
            })
            .frame(width: 44, height: 44, alignment: .center)
        }
    }
}

struct NotificationFollowView: View {
    var body: some View {
        HStack {
            // user image
            Image("User1-\(Int.random(in: 1...4))")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20)
            // text, date
            VStack(alignment: .leading) {
                Text("sandrosamkharadze started following you.")
                Text("\(Int.random(in: 1...59)) minutes ago")
                    .foregroundColor(Color(.secondaryLabel))

            }
            Spacer()
            // follow button
            Button(action: {
                
            }, label: {
                Text("Follow")
                    .frame(width: 80, height: 30, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color(.link))
                    .cornerRadius(8)
            })
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
            .preferredColorScheme(.dark)
    }
}
