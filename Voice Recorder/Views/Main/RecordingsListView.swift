//
//  RecordingsListView.swift
//  Voice Recorder
//
//  Created by Pinlun on 2019/10/30.
//  Copyright © 2019 Pinlun. All rights reserved.
//

import SwiftUI

struct RecordingsListView: View {
    
    @EnvironmentObject var audioRecorderService: AudioRecorderService
    
    var body: some View {
        NavigationView {
            List {
                ForEach(audioRecorderService.recordings) { recording in
                    RecordingRow(recording: recording)
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Recordings")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    private func delete(at offsets: IndexSet) {
        var urlsToDelete: [URL] = []
        for index in offsets {
            urlsToDelete.append(audioRecorderService.recordings[index].fileURL)
        }
        audioRecorderService.deleteRecordings(urlsToDelete: urlsToDelete)
    }
}

struct RecordingsListView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingsListView()
            .environmentObject(AudioRecorderService())
    }
} 