//
//  LandMarksApp.swift
//  LandMarks
//
//  Created by Luis Madriz on 12/7/21.
//

import SwiftUI

@main
struct LandMarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
