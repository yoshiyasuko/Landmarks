//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Yoshiyasu KO on 2023/01/29.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
