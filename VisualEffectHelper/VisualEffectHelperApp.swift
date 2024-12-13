//
//  VisualEffectHelperApp.swift
//  VisualEffectHelper
//
//  Created by ash on 12/13/24.
//

import SwiftUI

@main
struct VisualEffectHelperApp: App {
    var body: some Scene {
        WindowGroup {
            ResponsiveGridView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}
