//
//  DynamicRequest.swift
//  BiliMonitor
//
//  Created by Zr埋 on 2022/12/1.
//

import Alamofire

struct DynamicManager {
    static func getDynamics(uid: String, offset: String = "") async throws -> DynamicData? {
        let url = "https://api.bilibili.com/x/polymer/web-dynamic/v1/feed/space?offset=\(offset)&host_mid=\(uid)&timezone_offset=-480"
        let value = try await AF.request(url).serializingDecodable(DynamicResponse.self).value
        
        return value.data
    }
}
