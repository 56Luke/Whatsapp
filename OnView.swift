//
//  OnView.swift
//  Whatsapp
//
//  Created by Lucas Mathebula on 2023/09/28.
//

import SwiftUI

struct OnView: View {
    
    @State private var scale: CGFloat = 1.5
    
    var body: some View {
        
        Image("call")
            .resizable()
            .background(Color.green)
            .foregroundColor(Color.blue)
            .frame(width: 200, height: 200)
            .cornerRadius(100)
            .scaleEffect(scale)
            .onAppear {
              let initialAnimation =
                Animation.easeInOut(duration: 5)
              let repeatAnimation = initialAnimation
                .repeatForever(autoreverses: true)
                
                withAnimation(repeatAnimation) {
                    scale = 0.1
                }
            }
        
    }
}

struct OnView_Previews: PreviewProvider {
    static var previews: some View {
        OnView()
    }
}
