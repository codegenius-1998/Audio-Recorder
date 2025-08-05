//
//  AudioPlayerService.swift
//  Voice Recorder
//
//  Created by Pinlun on 2019/10/30.
//  Copyright © 2019 Pinlun. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

class AudioPlayerService: NSObject, ObservableObject, AVAudioPlayerDelegate {
    
    @Published var isPlaying = false
    @Published var currentAudioURL: URL?
    
    private var audioPlayer: AVAudioPlayer?
    
    func startPlayback(audio: URL) {
        do {
            try AudioSessionManager.shared.configureForPlayback()
            
            audioPlayer = try AVAudioPlayer(contentsOf: audio)
            audioPlayer?.delegate = self
            audioPlayer?.play()
            
            isPlaying = true
            currentAudioURL = audio
            
        } catch {
            print("Playback failed: \(error)")
        }
    }
    
    func stopPlayback() {
        audioPlayer?.stop()
        isPlaying = false
        currentAudioURL = nil
    }
    
    func pausePlayback() {
        audioPlayer?.pause()
        isPlaying = false
    }
    
    func resumePlayback() {
        audioPlayer?.play()
        isPlaying = true
    }
    
    // MARK: - AVAudioPlayerDelegate
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        DispatchQueue.main.async {
            self.isPlaying = false
            self.currentAudioURL = nil
        }
    }
} 