//
//  AudioRecorderService.swift
//  Voice Recorder
//
//  Created by Pinlun on 2019/10/30.
//  Copyright © 2019 Pinlun. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

class AudioRecorderService: NSObject, ObservableObject {
    
    @Published var recordings: [Recording] = []
    @Published var isRecording = false
    
    private var audioRecorder: AVAudioRecorder?
    private let fileManagerService = FileManagerService()
    
    override init() {
        super.init()
        fetchRecordings()
    }
    
    func startRecording() {
        do {
            try AudioSessionManager.shared.configureForRecording()
            
            let audioFilename = fileManagerService.createAudioFileURL()
            
            let settings: [String: Any] = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 12000,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder?.record()
            isRecording = true
            
        } catch {
            print("Could not start recording: \(error)")
        }
    }
    
    func stopRecording() {
        audioRecorder?.stop()
        isRecording = false
        fetchRecordings()
    }
    
    func fetchRecordings() {
        recordings = fileManagerService.getAudioRecordings()
        recordings.sort { $0.createdAt.compare($1.createdAt) == .orderedAscending }
    }
    
    func deleteRecordings(urlsToDelete: [URL]) {
        fileManagerService.deleteAudioFiles(urls: urlsToDelete)
        fetchRecordings()
    }
} 