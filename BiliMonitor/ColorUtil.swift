//
//  ColorUtil.swift
//  BiliMonitor
//
//  Created by Zr埋 on 2022/12/2.
//


import SwiftUI

extension Color {
    static let biliPink = Color.hex("#e87295")
}

extension Color {
    static func hex(_ hex: String) -> Color {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return .gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        
        return Color(red: Double((rgbValue & 0xFF0000) >> 16) / 255.0, green: Double((rgbValue & 0x00FF00) >> 8) / 255.0, blue: Double(rgbValue & 0x0000FF) / 255.0)
    }
}
