//
//  LoginView.swift
//  Pocket
//
//  Created by Mac on 1/18/24.
//

import SwiftUI
import PhoneNumberKit


struct LoginView: View {
    
    @State var phoneNumberString: String = ""
    @State var phoneNumberColor = Color.primary
    @FocusState var keyboardShowing
    @State private var isNextButtonTapped = false
    @State private var isVerificationCodeSent = false
    @State var e164PhoneNumber: String = ""
    @State var otpcode: String
    let phoneNumberKit = PhoneNumberKit()
    
        
    func phoneNumberChange() {
        phoneNumberColor = .primary
        let formattedNumber = PartialFormatter().formatPartial(phoneNumberString)
        if formattedNumber != phoneNumberString {
            print("set \(formattedNumber)")
            phoneNumberString = formattedNumber
        } else {
            print("skip")
        }
    }
    
    func nextClick() {
        guard let phoneNumber = try? phoneNumberKit.parse(phoneNumberString) else {
            print("invalid phone number")
            phoneNumberColor = .red
            return
        }
        
        e164PhoneNumber = phoneNumberKit.format(phoneNumber, toType: .e164)
        print(e164PhoneNumber)
        Task{
            do {
                let _ = try await Api.shared.sendVerificationToken(e164PhoneNumber:e164PhoneNumber)
                isVerificationCodeSent = true
            } catch let apiError as ApiError {
                phoneNumberColor = .red
               let errorString = apiError.message
            }
        }
    }
    
    
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Enter your mobile number").bold()
                Spacer().frame(height: 20)
                HStack {
                    Text("🇺🇸 +1")
                    TextField("(500) 555-1234", text: $phoneNumberString)
                        .keyboardType(.phonePad)
                        .foregroundColor(phoneNumberColor)
                        .focused($keyboardShowing)
                        .onChange(of: phoneNumberString) {
                            phoneNumberChange()
                        }
                }
                .padding([.leading, .trailing])
                Rectangle()
                    .padding([.leading, .trailing])
                    .frame(height: 1)
                    .foregroundColor(.gray.opacity(0.5))
                Spacer().frame(height: 24)
                
                Button {
                    nextClick()
                    isNextButtonTapped = true
                } label: {
                    Text("NEXT").bold()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                }
                .buttonStyle(.borderedProminent)
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .contentShape(Rectangle())
            .onTapGesture {
                keyboardShowing = false
            }
            
   }

        }
}



#Preview {
    LoginView(otpcode: "123456")
}
