//
//  ContentView.swift
//  NewSound
//
//  Created by Mashael Alghunaim on 15/06/1444 AH.
//

import SwiftUI
import Speech
struct ContentView: View {
    @State var pickedTheme = "1"
    @State private var animateAquaColor = false
    @State private var animateSkyColor = false
    @ObservedObject var closedCap = ClosedCaptioning()
    @ObservedObject var arabicClosedCap = ArabicClosedCaptioning()
    @State private var micEnabled: Bool = false
    var body: some View {
        ZStack{
            Color("darkBlue")
                .ignoresSafeArea()
            VStack{
                Text("اختر اللغة المراد عرضها:").foregroundColor(Color.white)
                    .font(.system(size: 20))
                    .padding(.bottom, 700.0)
                    .padding(.leading,160.0)
                
                
            }
            
            Picker(" ", selection: $pickedTheme, content: {
                Text("العربية").tag("1")
                    .foregroundColor(.gray)
                Text("الإنجليزية").tag("2")
                
                
            }).padding(.bottom, 600.0).pickerStyle(.segmented)
                .padding(.horizontal)
            
           // Divider()
            
            
            VStack {
                if pickedTheme == "2"{
                    Text(self.closedCap.captioning).foregroundColor(Color.white)
                        .font(.system(size: 30))
                    .padding(.top, 280)}
                else{
                    Text(self.arabicClosedCap.captioning).foregroundColor(Color.white)
                            .font(.system(size: 30))
                        .padding(.top, 280)}
                }
                if pickedTheme == "2"{
                    Button( action: {
                        self.closedCap.micButtonTapped() })
                    {
                        ZStack{
                            Circle()
                                .frame(width: 200, height: 200, alignment: .bottomLeading)
                                .foregroundColor(Color("veryMediumBlue"))
                                .scaleEffect(animateSkyColor ? 1 : 0.8)
                                .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true).speed(2), value: animateSkyColor)
                            Circle()
                                .frame(width: 120, height: 120, alignment: .bottomLeading)
                                .foregroundColor(Color("mediumblue"))
                                .scaleEffect(animateSkyColor ? 1 : 1.5)
                                .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true).speed(3), value: animateAquaColor)
                            
                            Image (systemName: "ear")
                                .font(.system(size: 100))
                                .foregroundColor(.white)
                                .frame(width: 200, height: 200)
                        }
                    }
                    
                }
                else{
                    Button( action: {
                        self.arabicClosedCap.micButtonTapped() })
                    {
                        ZStack{
                            Circle()
                                .frame(width: 200, height: 200, alignment: .bottomLeading)
                                .foregroundColor(Color("veryMediumBlue"))
                                .scaleEffect(animateSkyColor ? 1 : 0.8)
                                .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true).speed(2), value: animateSkyColor)
                            Circle()
                                .frame(width: 120, height: 120, alignment: .bottomLeading)
                                .foregroundColor(Color("mediumblue"))
                                .scaleEffect(animateSkyColor ? 1 : 1.5)
                                .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true).speed(3), value: animateAquaColor)
                            
                            Image (systemName: "ear")
                                .font(.system(size: 100))
                                .foregroundColor(.white)
                                .frame(width: 200, height: 200)
                        }
                    }
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
