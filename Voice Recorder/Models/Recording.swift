//
//  Recording.swift
//  Voice Recorder
//
//  Created by Pinlun on 2019/10/30.
//  Copyright © 2019 Pinlun. All rights reserved.
//

import Foundation

struct Recording: Identifiable, Equatable {
    let id = UUID()
    let fileURL: URL
    let createdAt: Date
    let fileName: String
    
    init(fileURL: URL, createdAt: Date) {
        self.fileURL = fileURL
        self.createdAt = createdAt
        self.fileName = fileURL.lastPathComponent
    }
    
    static func == (lhs: Recording, rhs: Recording) -> Bool {
        return lhs.id == rhs.id
    }
} 