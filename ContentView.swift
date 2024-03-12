//
//  ContentView.swift
//  Whatsapp
//
//  Created by Lucas Mathebula on 2023/09/16.
//

import SwiftUI

struct ContentView: View {
    
    @State private var flipped = false
    @State private var animate3d = false
    
       var body: some View {
           
           return VStack {
                 Spacer()

                 ZStack() {
                       FrontCardView().opacity(flipped ? 0.0 : 2.0)
                       BackCardView().opacity(flipped ? 2.0 : 0.0)
                       
                 }
               
                 //.rotation3DEffect(.degrees(flipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                 .modifier(FlipEffect(flipped: $flipped, angle: animate3d ? 180 : 0, axis: (x: 1, y: 0)))
                 .onTapGesture {
                       withAnimation(Animation.linear(duration: 0.8)) {
                             self.animate3d.toggle()
                       }
                 }
                 Spacer()
           
                
          
             
                   Text("From")
                       .fontWeight(.regular)
                   .foregroundColor(Color.gray)
               
                
  
           HStack {
               Image("meta")
               
               
               Text("Meta")
                   .font(.title2)
                   .foregroundColor(Color.green)
                   
              Spacer()
           }
           .padding(.leading, 170)
           .padding(.bottom, 110)
       }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          
           
           
        
    }
}

struct FlipEffect: GeometryEffect {

     var animatableData: Double {
           get { angle }
           set { angle = newValue }
         
     }

     @Binding var flipped: Bool
     var angle: Double
     let axis: (x: CGFloat, y: CGFloat)

     func effectValue(size: CGSize) -> ProjectionTransform {

           DispatchQueue.main.async {
                 self.flipped = self.angle >= 90 && self.angle < 270
           }

           let tweakedAngle = flipped ? -180 + angle : angle
           let a = CGFloat(Angle(degrees: tweakedAngle).radians)

           var transform3d = CATransform3DIdentity;
           transform3d.m34 = -1/max(size.width, size.height)

           transform3d = CATransform3DRotate(transform3d, a, axis.x, axis.y, 0)
           transform3d = CATransform3DTranslate(transform3d, -size.width/2.0, -size.height/2.0, 0)

           let affineTransform = ProjectionTransform(CGAffineTransform(translationX: size.width/2.0, y: size.height / 2.0))

           return ProjectionTransform(transform3d).concatenating(affineTransform)
     }
}

struct FrontCardView: View {
     var body: some View {
         
         Image("lvideo")
           
    }
}

struct BackCardView: View {
     var body: some View {
         
           Image("lchat")
          
     }
}

       
         
           
 
