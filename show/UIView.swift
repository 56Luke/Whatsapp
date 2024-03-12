//
//  UIView.swift
//  Whatsapp
//
//  Created by Lucas Mathebula on 2023/09/28.
//

import SwiftUI

struct UIView: View {
    
  
    @State var animate = false
       @State var endSplash = false
       var body: some View {
           NavigationView{
           ZStack{
               Color("Primary")
               
               Image("call").resizable().renderingMode(.original).aspectRatio(contentMode: animate ? .fill : .fit)
                   .frame(width: animate ? nil : 85, height: animate ? nil: 85)
                   .colorInvert().scaleEffect(animate ? 3 : 1).frame(width: UIScreen.main.bounds.width)
           }.ignoresSafeArea(.all, edges: .all).onAppear(perform: {
               animateSplash()
           }).opacity(endSplash ? 0:1)
       }
   }
       func animateSplash(){
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
               withAnimation(Animation.easeOut(duration: 0.45)){
                   animate.toggle()
               }
               withAnimation(Animation.linear(duration: 0.35)){
                   endSplash.toggle()
                   //Switch to another View here I guess ?
               }
           }
       }
   }

struct UIView_Previews: PreviewProvider {
    static var previews: some View {
        UIView()
            .background(Color.blue)
    }
}
