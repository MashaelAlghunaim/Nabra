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
    @State var animateSkyColor = false
    @ObservedObject var closedCap = ClosedCaptioning()
    @ObservedObject var arabicClosedCap = ArabicClosedCaptioning()
    @State private var micEnabled: Bool = false
    @State var animationRunning = true
    var animation: Animation {
        return animationRunning ? Animation.linear(duration: 1.5).repeatForever(autoreverses: animateSkyColor) : Animation.linear(duration: 1.5)
    }
    
    init(){
        UISegmentedControl.appearance().backgroundColor = .lightText
        UISegmentedControl.appearance().selectedSegmentTintColor = .lightText
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.black)], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.black)], for: .normal)
    }
    
    var body: some View {
        ZStack{
            Color("darkBlue")
                .ignoresSafeArea()
            VStack{
                Text("اختر اللغة المراد عرضها:").foregroundColor(Color.white)
                    .font(.title3)
                    .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                    .accessibilityShowsLargeContentViewer()
                    .frame(maxWidth: .infinity, alignment: .leading).padding()
                    
                Picker(" ", selection: $pickedTheme, content: {
                    Text("العربية").tag("1")
                        .foregroundColor(.gray)
                        .font(.title3)
                        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                        .accessibilityShowsLargeContentViewer()
                    Text("الإنجليزية").tag("2")
                        .font(.title3)
                        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                        .accessibilityShowsLargeContentViewer()
                    
                })
                .pickerStyle(.segmented)
                
                VStack {
                    if pickedTheme == "2"{
                        ScrollViewReader { value in
                                    ScrollView {

                                        Text(self.closedCap.captioning).foregroundColor(Color.white)
                                            .font(.largeTitle)
                                            .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                                            .accessibilityShowsLargeContentViewer()
                                            .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                                            .accessibilityShowsLargeContentViewer()
                                            .padding()
                                            .id(50)
                                    }
                                    .onChange(of: self.closedCap.captioning) { newValue in
                                        value.scrollTo(50, anchor: .top)
                                    }
                                }
                                .frame(height: 300)
                    }
                    else{

                        ScrollViewReader { value in
                                    ScrollView {
                                        
                                        Text(self.arabicClosedCap.captioning).foregroundColor(Color.white)
                                            .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                                            .accessibilityShowsLargeContentViewer()
                                            .font(.largeTitle).padding()
                                            .id(50)
                                            .onChange(of: self.arabicClosedCap.captioning) { newValue in
                                                value.scrollTo(50, anchor: .bottom)
                                            }
                                    }
                                    .frame(height: 300.0)
                                    
                                }
                        
                    }
                    
                }
                if pickedTheme == "2"{
                    ZStack {
                        Button(action: {
                            self.closedCap.micButtonTapped()
                            self.animateSkyColor.toggle()
                        })
                        {
                            ZStack{
                                Circle().fill(Color("veryMediumBlue").opacity(0.45)).frame(width: 381, height: 381).scaleEffect(self.animateSkyColor ? 1: 0)
                                Circle().fill(Color("veryMediumBlue").opacity(0.35)).frame(width: 314, height: 314).scaleEffect(self.animateSkyColor ? 1: 0)
                                Circle().fill(Color("veryMediumBlue").opacity(0.25)).frame(width: 240, height: 240).scaleEffect(self.animateSkyColor ? 1: 0)
                                Circle().fill(Color("veryMediumBlue")).frame(width: 169, height: 169)
                                
                                Image (systemName: "ear")
                                    .font(.system(size: 100))
                                    .foregroundColor(.white)
                                    .frame(width: 200, height: 200)
                                
                                
                            }
                         
                                
                        }
                        
                    }
                } else{
                    ZStack {
                        Button(action: {
                            self.arabicClosedCap.micButtonTapped()
                            self.animateSkyColor.toggle()
                           
                        })
                        {
                            ZStack{
                                Circle().fill(Color("veryMediumBlue").opacity(0.45)).frame(width: 381, height: 381).scaleEffect(self.animateSkyColor ? 1: 0)
                                Circle().fill(Color("veryMediumBlue").opacity(0.35)).frame(width: 314, height: 314).scaleEffect(self.animateSkyColor ? 1: 0)
                                Circle().fill(Color("veryMediumBlue").opacity(0.25)).frame(width: 240, height: 240).scaleEffect(self.animateSkyColor ? 1: 0)
                                Circle().fill(Color("veryMediumBlue")).frame(width: 169, height: 169)
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
        
    }
    func micButtonTapped() {
        micEnabled.toggle()
        if !micEnabled {
            animationRunning = false
        } else {
            animationRunning = true
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
