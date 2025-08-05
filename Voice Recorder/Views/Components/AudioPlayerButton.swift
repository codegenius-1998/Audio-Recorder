//
//  AudioPlayerButton.swift
//  Voice Recorder
//
//  Created by Pinlun on 2019/10/30.
//  Copyright © 2019 Pinlun. All rights reserved.
//

import SwiftUI

struct AudioPlayerButton: View {
    let audioURL: URL
    @StateObject private var audioPlayer = AudioPlayerService()
    
    var body: some View {
        Button(action: {
            if audioPlayer.isPlaying {
                audioPlayer.stopPlayback()
            } else {
                audioPlayer.startPlayback(audio: audioURL)
            }
        }) {
            Image(systemName: audioPlayer.isPlaying ? "stop.fill" : "play.circle")
                .imageScale(.large)
                .foregroundColor(audioPlayer.isPlaying ? .red : .blue)
        }
    }
} 