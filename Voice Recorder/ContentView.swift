//
//  ContentView.swift
//  Voice Recorder
//
//  Created by Pinlun on 2019/10/30.
//  Copyright © 2019 Pinlun. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var audioRecorder: AudioRecorder
    @State private var showMeaning = false
    @State private var isPlaying = false
    @State private var recordingTimer: Timer?
    @State private var recordingTime: TimeInterval = 0
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // ステータスバーとExitボタン
                HStack(alignment: .top) {
                    // プログレスバー
                    GeometryReader { geometry in
                        VStack(spacing: 2) {
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(height: 12)
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray.opacity(0.5))
                                    .frame(width: geometry.size.width * 0.2, height: 12)
                            }
                            Text("9:32")
                                .font(.system(size: 12))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }.padding(.trailing, 16)
                    
                    Button("Exit") {
                        
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                .padding(.horizontal, 16)
                .frame(width: .infinity, height: 100)

                // メインコンテンツカード
                VStack(spacing: 20) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 0)
                            .frame(height: 300)
                        
                        VStack(spacing: 30) {
                            Image("image")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                            
                            // Show meaning ボタン
                            Button(action: {
                                showMeaning.toggle()
                            }) {
                                HStack {
                                    Text("Show meaning")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.black)
                                    
                                    Image(systemName: "chevron.down")
                                        .font(.system(size: 12))
                                        .foregroundColor(.black)
                                        .rotationEffect(.degrees(showMeaning ? 180 : 0))
                                }
                            }
                            
                            Text("This is Message Icon")
                                .font(.system(size: 14))
                                .foregroundColor(showMeaning ? .white : .black)
                        }
                        
                        // スピーカーボタン
                        VStack {
                            HStack {
                                Spacer()
                                Button(action: {
                                    isPlaying.toggle()
                                    // 音声再生機能
                                }) {
                                    Image(systemName: "speaker.wave.2")
                                        .font(.system(size: 16))
                                        .foregroundColor(.black)
                                        .frame(width: 32, height: 32)
                                        .background(Color.white)
                                        .clipShape(Circle())
                                        .overlay(
                                            Circle()
                                                .stroke(Color.black, lineWidth: 1)
                                        )
                                }
                            }
                            Spacer()
                        }
                        .padding(.top, 20)
                        .padding(.trailing, 20)
                    }
                    .frame(height: 300)
                    .padding(.bottom, 100)
                }
                .padding(.horizontal, 32)
                
                // 指示テキスト
                Rectangle()
                    .fill(Color.gray.opacity(0.1))
                    .overlay(
                        VStack {
                            Text("Listen and repeat after the example")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.trailing)
                                .padding(.horizontal, 20)
                            
                            Text(formatTime(recordingTime))
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(recordingTimer != nil ? .black : .clear)
                                .padding(.vertical, 20)
                            
                            // 録音ボタン
                            Button(action: {
                                if audioRecorder.recording {
                                    audioRecorder.stopRecording()
                                    stopRecordingTimer()
                                } else {
                                    audioRecorder.startRecording()
                                    startRecordingTimer()
                                }
                            }) {
                                Image(systemName: audioRecorder.recording ? "stop.fill" : "mic.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(.white)
                                    .frame(width: 80, height: 80)
                                    .background(Color.black)
                                    .clipShape(Circle())
                            }
                            
                            Spacer()
                            
                            // ホームインジケーター
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: 40, height: 4)
                                .cornerRadius(2)
                                .padding(.bottom, 10)
                            
                        }.padding(.top, 20),
                        alignment: .top
                    )
            }
        }
    }
    
    // 録音タイマーを開始
    private func startRecordingTimer() {
        recordingTime = 0
        recordingTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            recordingTime += 1
        }
    }
    
    // 録音タイマーを停止
    private func stopRecordingTimer() {
        recordingTimer?.invalidate()
        recordingTimer = nil
    }
    
    // 時間をフォーマット（MM:SS形式）
    private func formatTime(_ timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

// 三角形のシェイプ
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(audioRecorder: AudioRecorder())
    }
}
