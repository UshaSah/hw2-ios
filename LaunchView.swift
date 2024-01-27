//
//  LoginView.swift
//  Pocket
//
//  Created by Mac on 1/18/24.
//
import SwiftUI

struct LaunchView: View {
    @State private var isActive: Bool = false
    @State var otpcode: String
    
    var body: some View {
        NavigationStack{
            VStack {
                Image("ePocket")
                Text("ePocket").font(.largeTitle)
                    .padding()
                
                
            }
            
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isActive = true
                }
            }
            
            //.hidden()
            //.disabled(true)
            .background(
                NavigationLink("",
                               destination: LoginView(otpcode: otpcode),
                               isActive: $isActive)
            )
            
        }}
        
}

//struct NextScreen: View {
//    let value: Int
//    
//    init(value: Int) {
//        self.value = value
//    }
//}



#Preview {
    NavigationStack{
        LaunchView(otpcode: "123456")
    }
}
