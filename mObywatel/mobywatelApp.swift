//
//  mobywatelApp.swift
//  mobywatel
//

import SwiftUI

var mainWindow = true;
@main
struct mobywatelApp: App {
    var body: some Scene {
        WindowGroup {
            if (mainWindow) {
                ContentView()
                    .preferredColorScheme(.light)
            }
            else {
                idView()
                    .preferredColorScheme(.light)
            }
        }
    }
}
