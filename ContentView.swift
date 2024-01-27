//
//  ContentView.swift
//  Pocket
//
//  Created by Mac on 1/18/24.
//

import SwiftUI

struct ContentView: View {
    @State var otpcode: String = ""
    var body: some View {
        LaunchView(otpcode: otpcode)
            
            }
                    
}




#Preview {
    ContentView()
}
