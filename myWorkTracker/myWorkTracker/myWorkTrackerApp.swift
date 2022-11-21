//
//  myWorkTrackerApp.swift
//  myWorkTracker
//
//  Created by Pedro Alejandro on 11/16/22.
//

import SwiftUI

@main
struct myWorkTrackerApp: App {
    var auth = AuthUser()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(auth)
        }
    }
}
