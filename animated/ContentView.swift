//
//  ContentView.swift
//  animated
//
//  Created by Mpore on 17/09/2024.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    @AppStorage("selectedTab") var selectedtab: Tab = .chat
    @State var isOpen = false
    let button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)

    var body: some View {
        ZStack {
            
            Group{
                switch selectedtab {
                case .chat:
                    HomeView()
                case .search:
                    Text("search")

                case .timer:
                    Text("timer")

                case .bell:
                    Text("bell")

                case .user:
                    Text("user")

                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 80)
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 104)
            }
            .ignoresSafeArea()
            
            button.view()
                .frame(width: 44, height: 44)
                .mask(Circle())
                .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                .frame(maxWidth: .infinity, maxHeight:.infinity, alignment: .topLeading)
                .onTapGesture {
                    try? button.setInput("isOpen", value: isOpen)
                    isOpen.toggle()
                }
            
            
            TabBar()
        }
    }
}

#Preview {
    ContentView()
}
