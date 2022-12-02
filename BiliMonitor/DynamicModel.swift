// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dynamicResponse = try? newJSONDecoder().decode(DynamicResponse.self, from: jsonData)

import Foundation

// MARK: - DynamicResponse
struct DynamicResponse: Codable {
    let code: Int?
    let message: String?
    let ttl: Int?
    let data: DynamicData?
}

// MARK: - DataClass
struct DynamicData: Codable {
    let hasMore: Bool?
    let items: [Dynamic]?
    let offset, updateBaseline: String?
    let updateNum: Int?

    enum CodingKeys: String, CodingKey {
        case hasMore = "has_more"
        case items, offset
        case updateBaseline = "update_baseline"
        case updateNum = "update_num"
    }
}

// MARK: - DataItem
struct Dynamic: Codable {
    let basic: Basic?
    let idStr: String?
    let modules: ItemModules?
    let type: String?
    let visible: Bool?
    let orig: Orig?

    enum CodingKeys: String, CodingKey {
        case basic
        case idStr = "id_str"
        case modules, type, visible, orig
    }
}

// MARK: - Basic
struct Basic: Codable {
    let commentIDStr: String?
    let commentType: Int?
    let likeIcon: LikeIcon?
    let ridStr: String?

    enum CodingKeys: String, CodingKey {
        case commentIDStr = "comment_id_str"
        case commentType = "comment_type"
        case likeIcon = "like_icon"
        case ridStr = "rid_str"
    }
}

// MARK: - LikeIcon
struct LikeIcon: Codable {
    let actionURL, endURL: String?
    let id: Int?
    let startURL: String?

    enum CodingKeys: String, CodingKey {
        case actionURL = "action_url"
        case endURL = "end_url"
        case id
        case startURL = "start_url"
    }
}

// MARK: - ItemModules
struct ItemModules: Codable {
    let moduleAuthor: ModuleAuthor?
    let moduleDynamic: PurpleModuleDynamic?
    let moduleInteraction: ModuleInteraction?
    let moduleMore: ModuleMore?
    let moduleStat: ModuleStat?
    let moduleTag: ModuleTag?

    enum CodingKeys: String, CodingKey {
        case moduleAuthor = "module_author"
        case moduleDynamic = "module_dynamic"
        case moduleInteraction = "module_interaction"
        case moduleMore = "module_more"
        case moduleStat = "module_stat"
        case moduleTag = "module_tag"
    }
}

// MARK: - ModuleAuthor
struct ModuleAuthor: Codable {
    let face: String?
    let faceNft: Bool?
    let following: Bool?
    let jumpURL, label: String?
    let mid: Int?
    let name: String?
    let officialVerify: OfficialVerify?
    let pendant: Pendant?
    let pubAction, pubLocationText, pubTime: String?
    let pubTs: Int?
    let type: String?
    let vip: Vip?

    enum CodingKeys: String, CodingKey {
        case face
        case faceNft = "face_nft"
        case following
        case jumpURL = "jump_url"
        case label, mid, name
        case officialVerify = "official_verify"
        case pendant
        case pubAction = "pub_action"
        case pubLocationText = "pub_location_text"
        case pubTime = "pub_time"
        case pubTs = "pub_ts"
        case type, vip
    }
}

// MARK: - OfficialVerify
struct OfficialVerify: Codable {
    let desc: String?
    let type: Int?
}

// MARK: - Pendant
struct Pendant: Codable {
    let expire: Int?
    let image, imageEnhance: String?
    let imageEnhanceFrame, name: String?
    let pid: Int?

    enum CodingKeys: String, CodingKey {
        case expire, image
        case imageEnhance = "image_enhance"
        case imageEnhanceFrame = "image_enhance_frame"
        case name, pid
    }
}

// MARK: - Vip
struct Vip: Codable {
    let avatarSubscript: Int?
    let avatarSubscriptURL: String?
    let dueDate: Int?
    let label: Label?
    let nicknameColor: String?
    let status, themeType, type: Int?

    enum CodingKeys: String, CodingKey {
        case avatarSubscript = "avatar_subscript"
        case avatarSubscriptURL = "avatar_subscript_url"
        case dueDate = "due_date"
        case label
        case nicknameColor = "nickname_color"
        case status
        case themeType = "theme_type"
        case type
    }
}

// MARK: - Label
struct Label: Codable {
    let bgColor: String?
    let bgStyle: Int?
    let borderColor, imgLabelURIHans: String?
    let imgLabelURIHansStatic: String?
    let imgLabelURIHant: String?
    let imgLabelURIHantStatic: String?
    let labelTheme, path, text, textColor: String?
    let useImgLabel: Bool?

    enum CodingKeys: String, CodingKey {
        case bgColor = "bg_color"
        case bgStyle = "bg_style"
        case borderColor = "border_color"
        case imgLabelURIHans = "img_label_uri_hans"
        case imgLabelURIHansStatic = "img_label_uri_hans_static"
        case imgLabelURIHant = "img_label_uri_hant"
        case imgLabelURIHantStatic = "img_label_uri_hant_static"
        case labelTheme = "label_theme"
        case path, text
        case textColor = "text_color"
        case useImgLabel = "use_img_label"
    }
}

// MARK: - PurpleModuleDynamic
struct PurpleModuleDynamic: Codable {
    let additional: Additional?
    let desc: ModuleDynamicDesc?
    let major: PurpleMajor?
}

// MARK: - Additional
struct Additional: Codable {
    let type: String?
    let upowerLottery: UpowerLottery?

    enum CodingKeys: String, CodingKey {
        case type
        case upowerLottery = "upower_lottery"
    }
}

// MARK: - UpowerLottery
struct UpowerLottery: Codable {
    let button: UButton?
    let desc: UpowerLotteryDesc?
    let isUpowerActive: Bool?
    let jumpURL: String?
    let rid, state: Int?
    let title: String?
    let upMid: Int?

    enum CodingKeys: String, CodingKey {
        case button, desc
        case isUpowerActive = "is_upower_active"
        case jumpURL = "jump_url"
        case rid, state, title
        case upMid = "up_mid"
    }
}

// MARK: - Button
struct UButton: Codable {
    let jumpStyle: JumpStyle?
    let jumpURL: String?
    let type: Int?

    enum CodingKeys: String, CodingKey {
        case jumpStyle = "jump_style"
        case jumpURL = "jump_url"
        case type
    }
}

// MARK: - JumpStyle
struct JumpStyle: Codable {
    let iconURL: String?
    let text: String?

    enum CodingKeys: String, CodingKey {
        case iconURL = "icon_url"
        case text
    }
}

// MARK: - UpowerLotteryDesc
struct UpowerLotteryDesc: Codable {
    let jumpURL: String?
    let style: Int?
    let text: String?

    enum CodingKeys: String, CodingKey {
        case jumpURL = "jump_url"
        case style, text
    }
}

// MARK: - ModuleDynamicDesc
struct ModuleDynamicDesc: Codable {
    let richTextNodes: [PurpleRichTextNode]?
    let text: String?

    enum CodingKeys: String, CodingKey {
        case richTextNodes = "rich_text_nodes"
        case text
    }
}

// MARK: - PurpleRichTextNode
struct PurpleRichTextNode: Codable {
    let origText, text, type: String?

    enum CodingKeys: String, CodingKey {
        case origText = "orig_text"
        case text, type
    }
}

// MARK: - PurpleMajor
struct PurpleMajor: Codable {
    let draw: Draw?
    let type: String?
    let archive: Archive?
}

// MARK: - Archive
struct Archive: Codable {
    let aid: String?
    let badge: Badge?
    let bvid: String?
    let cover: String?
    let desc: String?
    let disablePreview: Int?
    let durationText, jumpURL: String?
    let stat: Stat?
    let title: String?
    let type: Int?

    enum CodingKeys: String, CodingKey {
        case aid, badge, bvid, cover, desc
        case disablePreview = "disable_preview"
        case durationText = "duration_text"
        case jumpURL = "jump_url"
        case stat, title, type
    }
}

// MARK: - Badge
struct Badge: Codable {
    let bgColor, color, text: String?

    enum CodingKeys: String, CodingKey {
        case bgColor = "bg_color"
        case color, text
    }
}

// MARK: - Stat
struct Stat: Codable {
    let danmaku, play: String?
}

// MARK: - Draw
struct Draw: Codable {
    let id: Int?
    let items: [DrawItem]?
}

// MARK: - DrawItem
struct DrawItem: Codable {
    let height: Int?
    let size: Double?
    let src: String?

    let width: Int?
}

// MARK: - ModuleInteraction
struct ModuleInteraction: Codable {
    let items: [ModuleInteractionItem]?
}

// MARK: - ModuleInteractionItem
struct ModuleInteractionItem: Codable {
    let desc: ItemDesc?
    let type: Int?
}

// MARK: - ItemDesc
struct ItemDesc: Codable {
    let richTextNodes: [FluffyRichTextNode]?
    let text: String?

    enum CodingKeys: String, CodingKey {
        case richTextNodes = "rich_text_nodes"
        case text
    }
}

// MARK: - FluffyRichTextNode
struct FluffyRichTextNode: Codable {
    let origText, rid, text, type: String?
    let emoji: Emoji?

    enum CodingKeys: String, CodingKey {
        case origText = "orig_text"
        case rid, text, type, emoji
    }
}

// MARK: - Emoji
struct Emoji: Codable {
    let iconURL: String?
    let size: Int?
    let text: String?
    let type: Int?

    enum CodingKeys: String, CodingKey {
        case iconURL = "icon_url"
        case size, text, type
    }
}

// MARK: - ModuleMore
struct ModuleMore: Codable {
    let threePointItems: [ThreePointItem]?

    enum CodingKeys: String, CodingKey {
        case threePointItems = "three_point_items"
    }
}

// MARK: - ThreePointItem
struct ThreePointItem: Codable {
    let label, type: String?
}

// MARK: - ModuleStat
struct ModuleStat: Codable {
    let comment, forward: Comment?
    let like: Like?
}

// MARK: - Comment
struct Comment: Codable {
    let count: Int?
    let forbidden: Bool?
}

// MARK: - Like
struct Like: Codable {
    let count: Int?
    let forbidden, status: Bool?
}

// MARK: - ModuleTag
struct ModuleTag: Codable {
    let text: String?
}

// MARK: - Orig
struct Orig: Codable {
    let basic: Basic?
    let idStr: String?
    let modules: OrigModules?
    let type: String?
    let visible: Bool?

    enum CodingKeys: String, CodingKey {
        case basic
        case idStr = "id_str"
        case modules, type, visible
    }
}

// MARK: - OrigModules
struct OrigModules: Codable {
    let moduleAuthor: ModuleAuthor?
    let moduleDynamic: FluffyModuleDynamic?

    enum CodingKeys: String, CodingKey {
        case moduleAuthor = "module_author"
        case moduleDynamic = "module_dynamic"
    }
}

// MARK: - FluffyModuleDynamic
struct FluffyModuleDynamic: Codable {
    let major: FluffyMajor?
}

// MARK: - FluffyMajor
struct FluffyMajor: Codable {
    let archive: Archive?
    let type: String?
}

