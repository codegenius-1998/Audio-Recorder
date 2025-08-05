//
//  AudioSession.swift
//  Voice Recorder
//
//  Created by Pinlun on 2019/10/30.
//  Copyright © 2019 Pinlun. All rights reserved.
//

import Foundation
import AVFoundation

enum AudioSessionError: Error {
    case setupFailed
    case playbackFailed
    case recordingFailed
}

class AudioSessionManager {
    static let shared = AudioSessionManager()
    
    private init() {}
    
    func configureForRecording() throws {
        let session = AVAudioSession.sharedInstance()
        try session.setCategory(.playAndRecord, mode: .default)
        try session.setActive(true)
    }
    
    func configureForPlayback() throws {
        let session = AVAudioSession.sharedInstance()
        try session.overrideOutputAudioPort(.speaker)
    }
} 