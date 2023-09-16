//
//  ContentView.swift
//  hw1
//
//  Created by ATLAS Laptop 2 on 9/5/23.
//
import Foundation
import SwiftUI

struct ContentView: View {
    
    @State var switched: Bool = false
    @State private var showingSheet = false //state variable set to showingsheet set to a boolean false initially
    @State private var showAlert = false //define state variable showAlert and initialize it false
    @State private var searchpage = false
    
    @Binding var colorScheme: ColorScheme
    
    
    
    var body: some View { //body view declared
        NavigationView() {
            NavigationLink(destination: SearchView()) {
                Text("Search").padding().background(Color.accentColor)
                .foregroundStyle(.white)            }
            .navigationBarTitle("Home Page", displayMode: .inline)
        }
        HStack{
            Button ("Alert 1") {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("This alert has been activated."),
                    message: Text("Beep boop bop boop."))
            }.padding()
            Button ("Alert 2") {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("This alert has been activated."),
                    message: Text("Beep boop bop boop."))
            }.padding()
            
            Button ("Alert 3") {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("This alert has been activated."),
                    message: Text("Beep boop bop boop."))
            }.padding()
            
            
        }
        VStack { //vertical stack declared
            
            HStack { //horizontal stack declared
                Image(systemName: "person") //person icons placed in horizontal stack side by side
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Image(systemName: "person")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Image(systemName: "person")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Image(systemName: "person")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Image(systemName: "person")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            }
            .padding() //padding for design
            .padding()
            Circle() //blue circle
                .fill(Color.accentColor)
                .frame(width: 150, height: 150)
                .overlay( //use .overlay() method to lay text on top of shapes
                    Text("Let's get started!")
                        .font(.title)
                        .multilineTextAlignment(.center) .foregroundColor(.white))
            Text("Tap something to interact with the app. ")
                .padding()
            Toggle("", isOn: $switched) //use Toggle() to declare a button. This toggle has no text and when is on triggers the $switched flag
                .foregroundColor(Color.accentColor)
                .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                .frame(width: 60, height: 30, alignment: .center)
            if switched{ //when switched on, activate below code
                Text("Your journey begins. ") //text indicator
                    .foregroundColor(Color.accentColor)
            }
            
            Button("Show Sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SheetView()
                
            }
            
            
        }
        
        
        
        TabView {
            LightModeView(colorScheme: $colorScheme)
                .tabItem {
                    Label("Light Mode Ready", systemImage: "sun.max.fill")
                }
            DarkModeView(colorScheme: $colorScheme)
                .tabItem {
                    Label("Dark Mode Ready", systemImage: "moon.fill")
                    Button("Switch to Light Mode") {
                        colorScheme = .light
                    }
                }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(colorScheme: .constant(.light))
        }
    }
}


