//
//  logo.swift
//  NewSound
//
//  Created by Shahad Mohammed on 15/06/1444 AH.
//

import SwiftUI

struct logo: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if  isActive {
            ContentView()
        } else{
            ZStack {
               
                    Color("darkBlue")
                        .ignoresSafeArea()
                VStack{
                    Image("logo")
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                self.isActive = true
            }
        }
        }
           
               
           
       
       
    }
        
}

struct logo_Previews: PreviewProvider {
    static var previews: some View {
        logo()
    }
}
