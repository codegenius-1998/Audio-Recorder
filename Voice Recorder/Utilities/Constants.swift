//
//  Constants.swift
//  Voice Recorder
//
//  Created by Pinlun on 2019/10/30.
//  Copyright © 2019 Pinlun. All rights reserved.
//

import Foundation
import SwiftUI

struct Constants {
    struct Colors {
        static let primary = Color.black
        static let secondary = Color.gray
        static let background = Color.white
        static let cardBackground = Color.white
        static let shadow = Color.gray.opacity(0.2)
    }
    
    struct Fonts {
        static let title = Font.system(size: 18, weight: .bold)
        static let body = Font.system(size: 16, weight: .medium)
        static let caption = Font.system(size: 14, weight: .regular)
        static let small = Font.system(size: 12, weight: .regular)
    }
    
    struct Spacing {
        static let small: CGFloat = 8
        static let medium: CGFloat = 16
        static let large: CGFloat = 24
        static let extraLarge: CGFloat = 32
    }
    
    struct CornerRadius {
        static let small: CGFloat = 8
        static let medium: CGFloat = 12
        static let large: CGFloat = 20
    }
} 