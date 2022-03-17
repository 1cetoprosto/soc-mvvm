//
//  Other.swift
//  soc
//
//  Created by Леонід Квіт on 17.02.2022.
//

import Foundation

func secToTime(duration: Double?) -> String {
    let formatter = DateComponentsFormatter()
    formatter.unitsStyle = .positional // Use the appropriate positioning for the current locale
    
    guard let duration = duration else { return "00:00" }
    if duration > 3600 {
        formatter.allowedUnits = [ .hour, .minute, .second ] // Units to display in the formatted string
    } else {
        formatter.allowedUnits = [ .minute, .second ] // Units to display in the formatted string
    }
    
    formatter.zeroFormattingBehavior = [ .pad ] // Pad with zeroes where appropriate for the locale

    return formatter.string(from: duration ) ?? "0:00:00"
}


