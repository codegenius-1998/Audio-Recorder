//
//  RecordingTimer.swift
//  Voice Recorder
//
//  Created by Pinlun on 2019/10/30.
//  Copyright © 2019 Pinlun. All rights reserved.
//

import SwiftUI

struct RecordingTimer: View {
    @State private var recordingTimer: Timer?
    @State private var recordingTime: TimeInterval = 0
    let isRecording: Bool
    
    var body: some View {
        Text(formatTime(recordingTime))
            .font(.system(size: 18, weight: .medium))
            .foregroundColor(recordingTimer != nil ? .black : .clear)
            .padding(.vertical, 20)
            .onChange(of: isRecording) { newValue in
                if newValue {
                    startRecordingTimer()
                } else {
                    stopRecordingTimer()
                }
            }
    }
    
    private func startRecordingTimer() {
        recordingTime = 0
        recordingTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            recordingTime += 1
        }
    }
    
    private func stopRecordingTimer() {
        recordingTimer?.invalidate()
        recordingTimer = nil
    }
    
    private func formatTime(_ timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
} 