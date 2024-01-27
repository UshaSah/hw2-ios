//
//  PocketApp.swift
//  Pocket
//
//  Created by Mac on 1/18/24.
//

import SwiftUI

@main
struct PocketApp: App {
    
    var body: some Scene {
        @State var otpcode: String = ""
        WindowGroup {
            LaunchView(otpcode: otpcode)
        }
    }
}
