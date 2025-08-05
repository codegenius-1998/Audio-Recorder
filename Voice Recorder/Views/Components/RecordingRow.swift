//
//  RecordingRow.swift
//  Voice Recorder
//
//  Created by Pinlun on 2019/10/30.
//  Copyright © 2019 Pinlun. All rights reserved.
//

import SwiftUI

struct RecordingRow: View {
    let recording: Recording
    @StateObject private var audioPlayer = AudioPlayerService()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(recording.fileName)
                    .font(.system(size: 16, weight: .medium))
                    .lineLimit(1)
                
                Text(recording.createdAt.toString(dateFormat: "MMM dd, yyyy HH:mm"))
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            AudioPlayerButton(audioURL: recording.fileURL)
        }
        .padding(.vertical, 8)
    }
} 