//
//  DynsView.swift
//  BiliMonitor
//
//  Created by Zr埋 on 2022/12/1.
//

import SwiftUI
import SDWebImageSwiftUI

struct DynsView: View {
    @Environment(\.openURL) var openURL
    @EnvironmentObject var envObj: EnvObject
    
    @State private var dyns: [Dynamic] = []
    @State private var noMore: Bool = false
    @State private var lastOffset: String = ""
    @State private var stopLoad = false
    
    @State private var selectedUper = Uper()
    @State private var upers: [Uper] = [
        // add upers here
        Uper(name: "莫大韭菜", uid: "525121722"),
        Uper(name: "莫大稳住", uid: "370866794"),
        Uper(name: "吊打跪族", uid: "492309991"),
    ]
    
    
    
    private let UD_UPERS_KEY = "UD_UPERS_KEY"
    
    private func controlBar() -> some View {
        HStack {
            Picker("UP主选择：", selection: $selectedUper) {
                ForEach(upers, id: \.self) { up in
                    Text(up.name)
                }
            }
            .onChange(of: selectedUper, perform: { (value) in
                reload()
            })
            .frame(width: 200)

            
            Button(action: {
                reload()
            }) {
                HStack {
                    Text("刷新动态")
                    Image(systemName: "arrow.clockwise")
                }
            }
            .buttonStyle(.plain)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
    }
    
    private func header(dyn: Dynamic) -> some View {
        return HStack {
            WebImage(url: URL(string: dyn.modules?.moduleAuthor?.face ?? ""))
                .resizable()
                .indicator(.activity)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(dyn.modules?.moduleAuthor?.name ?? "")
                    .bold()
                    .foregroundColor(.biliPink)
                Text(TimeUtil.convertDate(ts: dyn.modules?.moduleAuthor?.pubTs ?? 0))
                    .font(.caption)
            }
            
            Spacer()
            if dyn.modules?.moduleTag?.text != nil {
                Text(dyn.modules?.moduleTag?.text ?? "")
                    .foregroundColor(.white)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.biliPink)
                    .cornerRadius(20)
            }
        }
    }
    
    private func mainBody(dyn: Dynamic) -> some View {
        return Group {
            if dyn.type! == "DYNAMIC_TYPE_DRAW" {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(dyn.modules?.moduleDynamic?.major?.draw?.items?.indices ?? 0..<0, id: \.self) { i in
                                WebImage(url: URL(string: dyn.modules?.moduleDynamic?.major?.draw?.items?[i].src ?? ""))
                                    .resizable()
                                    .indicator(.progress)
                                    .scaledToFit()
                                    .frame(maxHeight: 100)
                            }
                        }
                    }
                    Text(dyn.modules?.moduleDynamic?.desc?.text ?? "不知道是什么")
                        .lineLimit(nil)
                        .frame(maxWidth: .infinity,alignment: .leading)
                }
            } else if dyn.type! == "DYNAMIC_TYPE_WORD" {
                Text(dyn.modules?.moduleDynamic?.desc?.text ?? "不知道是什么")
                    .lineLimit(nil)
                    .frame(maxWidth: .infinity,alignment: .leading)
            } else if dyn.type! == "DYNAMIC_TYPE_AV" {
                VStack(alignment: .leading) {
                    Text(dyn.modules?.moduleAuthor?.pubAction ?? "")
                    Text(dyn.modules?.moduleDynamic?.major?.archive?.title ?? "")
                        .font(.title2)
                    WebImage(url: URL(string: dyn.modules?.moduleDynamic?.major?.archive?.cover ?? ""))
                        .resizable()
                        .indicator(.progress)
                        .scaledToFit()
                        .frame(maxWidth: 300)
                    
                }
            } else if dyn.type! == "DYNAMIC_TYPE_FORWARD" {
                Text("转发: " + (dyn.modules?.moduleDynamic?.desc?.text ?? "不知道是什么"))
                    .frame(maxWidth: .infinity,alignment: .leading)
            } else {
                Text("不知道是什么")
            }
        }
        .contextMenu {
            Button {
                envObj.oid = dyn.idStr ?? ""
                envObj.uid = selectedUper.uid
                envObj.tabIdx = 1
            } label: {
                Text("监控评论")
            }

        }
    }
    
    private func comments(dyn: Dynamic) -> some View {
        return Group {
            if dyn.modules?.moduleInteraction?.items?.isEmpty ?? true {
                EmptyView()
            } else {
                HStack {
                    Color.gray
                        .frame(width: 3, height: 30)
                    Image(systemName: "message")
                    Text("\(dyn.modules?.moduleInteraction?.items?.first?.desc?.richTextNodes?.first?.text ?? ""): \(dyn.modules?.moduleInteraction?.items?.first?.desc?.text ?? "")")
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            controlBar()
            
            ScrollView {
                
                LazyVStack {
                    
                    ForEach(dyns, id: \.idStr) { dyn in
                        VStack(alignment: .leading) {
                            
                            header(dyn: dyn)
                            
                            mainBody(dyn: dyn)
                            
                            comments(dyn: dyn)
                                .padding(.top)
                        }
                        .padding()
                        .background(content: {
                            Color.white
                        })
                        .padding(.vertical, 2)
                        .onTapGesture {
                            if dyn.type! == "DYNAMIC_TYPE_AV" {
                                openURL(URL(string: "https:\(dyn.modules?.moduleDynamic?.major?.archive?.jumpURL ?? "")")!)
                            } else {
                                openURL(URL(string: "https://t.bilibili.com/\(dyn.idStr ?? "")")!)
                            }
                        }
                    }
                    
                    
                    Group {
                        if noMore {
                            Text("没有了。。")
                        } else {
                            ProgressView()
                        }
                    }
                    .onAppear{
                        stopLoad = false
                        if !noMore {
                            loadMore()
                        }
                    }
                    .onDisappear {
                        stopLoad = true
                    }
                }
            }
        }
        .onAppear {
            loadUpers()
        }
    }
    
    private func loadUpers() {
        let data = UserDefaults.standard.string(forKey: "UD_UPERS_KEY") ?? "[]"
        do {
            let upers = try JSONDecoder().decode([Uper].self, from: Data(data.utf8))
            if !upers.isEmpty {
                self.upers = upers
            }
            if !self.upers.isEmpty {
                self.selectedUper = self.upers.first!
            }
        } catch {
            print("get upers error")
        }
    }
    
    private func saveUpers() {
        
    }
    
    private func reload() {
        self.lastOffset = ""
        self.noMore = false
        self.dyns.removeAll()
    }
    
    private func loadMore() {
        let offset = lastOffset
        Task {
            do {
                let data = try await NetManager.getDynamics(uid: self.selectedUper.uid, offset: offset)
                let dyns = data?.items ?? []
                if !(data?.hasMore ?? false) {
                    noMore = true
                }
                self.dyns += dyns
                lastOffset = data?.offset ?? ""
            } catch {
                print("get error: \(error)")
            }
            if !stopLoad {
                loadMore()
            }
        }
    }
}

struct DynsView_Previews: PreviewProvider {
    static var previews: some View {
        DynsView()
    }
}
