//
//  DynamicRequest.swift
//  BiliMonitor
//
//  Created by Zr埋 on 2022/12/1.
//

import Alamofire

struct NetManager {
    static func getDynamics(uid: String, offset: String = "") async throws -> DynamicData? {
        let url = "https://api.bilibili.com/x/polymer/web-dynamic/v1/feed/space?offset=\(offset)&host_mid=\(uid)&timezone_offset=-480"
        let value = try await AF.request(url).serializingDecodable(DynamicResponse.self).value
        
        return value.data
    }
    
    static func getComments(oid: String, next: Int = 0) async throws -> CommentData? {
        let url = "https://api.bilibili.com/x/v2/reply/main?type=17&oid=\(oid)&mode=2&next=\(next)"
        let value = try await AF.request(url, interceptor: Interceptor(adapters: [], retriers: [], interceptors: [RetryPolicy()]))
            .serializingDecodable(CommentResponse.self).value
        
        return value.data
    }
    
    static let replySession = Session(configuration: URLSessionConfiguration.af.default, interceptor: Interceptor(adapters: [], retriers: [], interceptors: [RetryPolicy()]))
    
    static func getReplies(oid: String, root: Int, pn: Int) async throws -> CommentData? {
        let url = "https://api.bilibili.com/x/v2/reply/reply?pn=\(pn)&type=17&oid=\(oid)&ps=10&root=\(root)"
        let value = try await replySession.request(url)
            .serializingDecodable(CommentResponse.self).value
        
        return value.data
    }
}
