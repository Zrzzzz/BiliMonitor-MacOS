//
//  ContentView.swift
//  BiliMonitor
//
//  Created by Zr埋 on 2022/12/1.
//


import SwiftUI

struct ContentView: View {
    @StateObject private var envObj = EnvObject()
   
    var body: some View {
        VStack {
            HStack(spacing: 40) {
                Button {
                    envObj.tabIdx = 0
                } label: {
                    VStack {
                        Image(systemName: "square.grid.2x2.fill")
                        Text("看动态")
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                }
                .buttonStyle(.plain)

                Button {
                    envObj.tabIdx = 1
                } label: {
                    VStack {
                        Image(systemName: "message.fill")
                        Text("看评论")
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                }
                .buttonStyle(.plain)
            }
            
            Group {
                switch (envObj.tabIdx) {
                case 0:
                    DynsView()
                default:
                    CommentsView()
                }
            }
            .environmentObject(envObj)

        }
        .background(Color.hex("#f3f5f7"))
        .frame(width: 500, height: 1000)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .light)
    }
}
