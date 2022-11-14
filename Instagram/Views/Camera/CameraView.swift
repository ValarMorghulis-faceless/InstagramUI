//
//  CameraView.swift
//  Instagram
//
//  Created by Giorgi Samkharadze on 13.11.22.
//

import SwiftUI

struct CameraView: View {
    
    @State var isShowingPicker = false
    @State var isUsingCamera = false
    @State var image: Image? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    image?
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300, alignment: .center)
                    
                    Button(action: {
                        self.isUsingCamera = false
                        self.isShowingPicker.toggle()
                     
                    }, label: {
                        Text("Photo Library")
                    })
                    .padding()
                    Button(action: {
                        self.isUsingCamera = true
                        self.isShowingPicker.toggle()
                    }, label: {
                        Text("Take Photo")
                    })
                    .padding()
                }
                if (isShowingPicker) {
                    CaptureView(isShown: $isShowingPicker, image: $image, isUsingCamera: $isUsingCamera)
                }
            }
            .navigationTitle("Camera")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
            .preferredColorScheme(.dark)
    }
}
