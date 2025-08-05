//
//  FileManagerService.swift
//  Voice Recorder
//
//  Created by Pinlun on 2019/10/30.
//  Copyright © 2019 Pinlun. All rights reserved.
//

import Foundation

class FileManagerService {
    
    private let fileManager = FileManager.default
    
    var documentDirectory: URL {
        return fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    func createAudioFileURL() -> URL {
        let fileName = Date().toString(dateFormat: "dd-MM-YY 'at' HH:mm:ss")
        return documentDirectory.appendingPathComponent("\(fileName).m4a")
    }
    
    func getAudioRecordings() -> [Recording] {
        var recordings: [Recording] = []
        
        do {
            let directoryContents = try fileManager.contentsOfDirectory(
                at: documentDirectory,
                includingPropertiesForKeys: nil
            )
            
            for audio in directoryContents {
                if audio.pathExtension == "m4a" {
                    let recording = Recording(
                        fileURL: audio,
                        createdAt: getFileDate(for: audio)
                    )
                    recordings.append(recording)
                }
            }
        } catch {
            print("Error fetching recordings: \(error)")
        }
        
        return recordings
    }
    
    func deleteAudioFiles(urls: [URL]) {
        for url in urls {
            do {
                try fileManager.removeItem(at: url)
            } catch {
                print("File could not be deleted: \(error)")
            }
        }
    }
    
    private func getFileDate(for url: URL) -> Date {
        do {
            let attributes = try fileManager.attributesOfItem(atPath: url.path)
            return attributes[.creationDate] as? Date ?? Date()
        } catch {
            return Date()
        }
    }
} 