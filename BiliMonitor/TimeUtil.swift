//
//  TimeUtil.swift
//  BiliMonitor
//
//  Created by Zr埋 on 2022/12/3.
//

import Foundation

struct TimeUtil {
    static func convertDate(ts: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(ts))
        let cur = Date()
        let dis = date.distance(to: cur)
        if dis < 60 * 60 {
            return "\(Int(dis/60))分前"
        } else if dis < 60 * 60 * 24 {
            return "\(Int(dis/60/60))小时前"
        }
        let dateFmt = DateFormatter()
        dateFmt.dateFormat = "MM-dd HH:mm"
        
        
        return dateFmt.string(from: date)
    }
}
