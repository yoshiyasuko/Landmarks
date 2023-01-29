//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Yoshiyasu KO on 2023/01/29.
//

import SwiftUI

@main
struct LandmarksApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LandmarkDetail()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
