//
//  ContentView.swift
//  Secured Credit Repair
//
//  Created by Dionne Rodriguez on 11/27/21.
//

import SwiftUI
import SwiftUINavigationBarColor


struct HomeView: View {
    
    init() {
            // 1.
        UINavigationBar.appearance().backgroundColor = UIColor(red: 68 / 255, green: 159 / 255, blue: 100 / 255, alpha: 1)
           
//            // 2.
//            UINavigationBar.appearance().largeTitleTextAttributes = [
//                .foregroundColor: UIColor.darkGray,
//                .font : UIFont(name:"Papyrus", size: 40)!]
//                    
//            // 3.
//            UINavigationBar.appearance().titleTextAttributes = [
//                .font : UIFont(name: "HelveticaNeue-Thin", size: 20)!]
        }
    
    @State var showMenu = false
    
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
            }
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    MainView(showMenu: self.$showMenu)
                        .frame (
                            width: geometry.size.width,
                            height:geometry.size.height
                        )
                    if self.showMenu {
                        MenuView()
                            .frame(
                                width: geometry.size.width/2
                            )
                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(drag)
            }
            .navigationBarTitle("Home", displayMode: .inline)
            .navigationBarItems(leading: (
                Button(action: {
                    withAnimation {
                        self.showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }))
        }
        .navigationTransparentBar(tintColor: .white) // mandatory
        .navigationBarHidden(true)
    }
}

struct MainView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        Text("Secured Credit Repair LLC")
            
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

