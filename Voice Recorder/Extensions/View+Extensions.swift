//
//  View+Extensions.swift
//  Voice Recorder
//
//  Created by Pinlun on 2019/10/30.
//  Copyright © 2019 Pinlun. All rights reserved.
//

import SwiftUI

extension View {
    func cardStyle() -> some View {
        self
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 0)
    }
    
    func buttonStyle() -> some View {
        self
            .font(.system(size: 14))
            .foregroundColor(.black)
            .padding(.horizontal, 32)
            .padding(.vertical, 8)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
} 