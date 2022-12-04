//
//  CommentModel.swift
//  BiliMonitor
//
//  Created by Zr埋 on 2022/12/3.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let commentResponse = try? newJSONDecoder().decode(CommentResponse.self, from: jsonData)

import Foundation

// MARK: - CommentResponse
struct CommentResponse: Codable {
    let code: Int?
    let message: String?
    let ttl: Int?
    let data: CommentData?
}

// MARK: - DataClass
struct CommentData: Codable {
    let cursor: Cursor?
    let replies: [Comment]?
    let top: Top?
    let topReplies: [Comment]?
    let page: Page?

    enum CodingKeys: String, CodingKey {
        case cursor, replies, top, page
        case topReplies = "top_replies"
    }
}

// MARK: - Cursor
struct Cursor: Codable {
    let isBegin: Bool?
    let prev, next: Int?
    let isEnd: Bool?
    let allCount, mode: Int?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case isBegin = "is_begin"
        case prev, next
        case isEnd = "is_end"
        case allCount = "all_count"
        case mode, name
    }
}

// MARK: - Content
struct Content: Codable {
    let message: String?
    let plat: Int?
    let device: String?
    let members: [Member]?
    let maxLine: Int?

    enum CodingKeys: String, CodingKey {
        case message, plat, device, members
        case maxLine = "max_line"
    }
}

// MARK: - Member
struct Member: Codable {
    let mid, uname, sex, sign: String?
    let avatar: String?
    let rank: String?
}

// MARK: - Upper
struct Comment: Codable {
    let rpid: Int?
    let oid: Double?
    let type, mid, root, parent: Int?
    let dialog, count, rcount, state: Int?
    let fansgrade, attr, ctime: Int?
    let rpidStr, rootStr, parentStr: String?
    let like, action: Int?
    let member: Member?
    let content: Content?
    let replies: [Comment]?
    let floor: Int?
    var ownReplies: [Comment]? = []

    enum CodingKeys: String, CodingKey {
        case rpid, oid, type, mid, root, parent, dialog, count, rcount, state, fansgrade, attr, ctime
        case rpidStr = "rpid_str"
        case rootStr = "root_str"
        case parentStr = "parent_str"
        case like, action, member, content, replies, floor
        case ownReplies
    }
}

// MARK: - Top
struct Top: Codable {
    let upper: Comment?
}

// MARK: - Page
struct Page: Codable {
    let count, num, size: Int?
}
