//
//  CommentsView.swift
//  BiliMonitor
//
//  Created by Zr埋 on 2022/12/2.
//

import SwiftUI

struct CommentsView: View {
    @Environment(\.openURL) var openURL
    @EnvironmentObject var envObj: EnvObject
    
    @State private var cmts: [Comment] = []
    @State private var noMore: Bool = false
    @State private var next: Int = 0
    @State private var stopLoad = false
    @State private var cmtMap: [Int: [Comment]] = [:]
    
    
    var body: some View {
        VStack {

            ScrollView {
                
                LazyVStack {
                    
                    ForEach(cmts.indices, id: \.self) { i in
                        let cmt = cmts[i]
                        VStack(alignment: .leading) {
                                Text(cmt.member?.uname ?? "")
                                    .font(.headline)
                                    .foregroundColor(.biliPink)
                            .padding(.bottom)
                            Text(cmt.content?.message ?? "")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom)
                            
                            
                            ForEach((cmtMap[cmt.rpid ?? 0] ?? []).indices, id: \.self) { k in
                                let mapC = (cmtMap[cmt.rpid ?? 0] ?? [])[k]
                                HStack {
                                    Color.gray
                                        .frame(width: 2, height: 20)
                                    Text("\(mapC.member?.uname ?? ""): \(mapC.content?.message ?? "")")
                                }
                            }
                            
                            Text(TimeUtil.convertDate(ts: cmt.ctime ?? 0))
                        }
                        .padding()
                        .background(content: {
                            Color.white
                        })
                        .padding(.vertical, 2)
                        .onTapGesture {
                            
                        }
                        .onAppear {
                            loadCommentReplies(root: cmt.rpid ?? 0)
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
    }
    
    private func loadMore() {
        Task {
            do {
                let data = try await NetManager.getComments(oid: envObj.oid, next: next)
                let cmts = data?.replies ?? []
                if (data?.cursor?.next ?? 0) == next {
                    noMore = true
                }
                self.cmts += cmts.filter({ cmt in
                    cmt.replies?.contains(where: { rp in
                        (rp.mid ?? 0).description == envObj.uid
                    }) ?? false || (cmt.member?.mid ?? "") == envObj.uid
                })
                if let n = data?.cursor?.next {
                    next = n
                }
            } catch {
                print("get error: \(error)")
            }
            if !stopLoad && !noMore {
                loadMore()
            }
        }
    }
    
    private func loadCommentReplies(root: Int) {
        guard (cmtMap[root] ?? []).isEmpty else { return }
        Task {
            var cmts: [Comment] = []
            var pn = 1
            print("\(root) started")
            do {
                while true {
                    let data = try await NetManager.getReplies(oid: envObj.oid, root: root, pn: pn)
                    let cnt = Double(data?.page?.count ?? 0)
                    let size = Double(data?.page?.size ?? 10)
                    cmts += data?.replies?.filter({ rp in
                        (rp.member?.mid ?? "") == envObj.uid
                    }) ?? []

                    if Int(ceil(cnt / size)) > pn {
                        pn += 1
                        print("\(root) continue \(Int(ceil(cnt / size))), \(pn)")
                    } else {
                        cmtMap[root] = cmts
                        print("\(root) ended")
                        break
                    }
                }
            } catch {
                print("get comment [\(root)] replies error \(error)")
            }
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}
