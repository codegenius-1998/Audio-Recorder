//
//  ProgressBar.swift
//  Voice Recorder
//
//  Created by Pinlun on 2019/10/30.
//  Copyright © 2019 Pinlun. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    let progress: Double
    let timeText: String
    
    var body: some View {
        VStack(spacing: 2) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 12)
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: UIScreen.main.bounds.width * 0.2, height: 12)
            }
            Text(timeText)
                .font(.system(size: 12))
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
} 