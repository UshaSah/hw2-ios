//
//  OTPScreen.swift
//  Pocket
//
//  Created by Mac on 1/25/24.
//

import SwiftUI
import PhoneNumberKit

struct OTPScreen: View {
    
    enum FocusPin {
         case  pinOne, pinTwo, pinThree, pinFour, pinFive, pinSix
     }

     @FocusState private var pinFocusState : FocusPin?
     @State var pinOne: String = ""
     @State var pinTwo: String = ""
     @State var pinThree: String = ""
     @State var pinFour: String = ""
     @State var pinFive: String = ""
     @State var pinSix: String = ""
        
     let phoneNumberKit = PhoneNumberKit()
     @State private var isVerificationCodeChecked = false
     @State var otpcode: String
//     @State var otpcount: Int = 0
     let e164PhoneNumber: String
    
//     let e164phonenumber : String
    func checkVerificationCode(){
//        let formattedNumber = PartialFormatter().formatPartial(phoneNumberString)
//        if formattedNumber != phoneNumberString {
//            print("set \(formattedNumber)")
//            phoneNumberString = formattedNumber
//        } else {
//            print("skip")
//        }
//        guard let phoneNumber = try? phoneNumberKit.parse(phoneNumberString) else {
//            print("invalid phone number")
//           
//            return
//        }
//        e164PhoneNumber = phoneNumberKit.format(e164PhoneNumber, toType: .e164)
        Task{
            do {
                let _ = try await Api.shared.checkVerificationToken(e164PhoneNumber: e164PhoneNumber, code: otpcode)
                isVerificationCodeChecked = true
            } catch let apiError as ApiError {
//                 phoneNumberColor = .red
                let errorString = apiError.message
            }
            
        }
    }
     //MARK -> BODY
     var body: some View {
         
//         ForEach(0..<6, id: \.self) { index in
//                 .onChange(of: pinValues[index]) { newVal in
//                                     if newVal.count == 1 {
//                                         pinFocusState = pinFocusState(forIndex: index)
//                                     } else if newVal.count == 0 {
//                                         pinFocusState = pinFocusState(forIndex: index - 1)
//                                     }
//                                 }
//                                 .focused($pinFocusState, equals: pinFocusState(forIndex: index))
//         }
         
         NavigationStack {
             VStack {
                     Text("Verify your Phone Number")
                         .font(.title2)
                         .fontWeight(.semibold)


                     Text("Enter 6 digit code we'll text you on Email")
                         .font(.caption)
                         .fontWeight(.thin)
                         .padding(.top)
                     
                     
                     
                 HStack(spacing:15, content: {
                     
                     TextField("", text: $pinOne)
                         .textFieldStyle(RoundedBorderTextFieldStyle())
                         .frame(width: 50)
                         .multilineTextAlignment(.center)
                         .modifier(OtpModifer(pin:$pinOne))
                         .keyboardType(.numberPad)
                         .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2) // Set the border color and width
                         )
                     
                         .onChange(of:pinOne){newVal in
                             if (newVal.count == 1) {
                                 pinFocusState = .pinTwo
                             }
                         }
                         .focused($pinFocusState, equals: .pinOne)
                     
                     
                     TextField("", text:  $pinTwo)
                         .textFieldStyle(RoundedBorderTextFieldStyle())
                         .frame(width: 50)
                         .multilineTextAlignment(.center)
                         .modifier(OtpModifer(pin:$pinTwo))
                         .keyboardType(.numberPad)
                         .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2) // Set the border color and width
                         )
                         .modifier(OtpModifer(pin:$pinTwo))
                         .onChange(of:pinTwo){newVal in
                             if (newVal.count == 1) {
                                 pinFocusState = .pinThree
                             }else {
                                 if (newVal.count == 0) {
                                     pinFocusState = .pinOne
                                 }
                             }
                         }
                         .focused($pinFocusState, equals: .pinTwo)
                     
                     
                     TextField("", text:$pinThree)
                         .textFieldStyle(RoundedBorderTextFieldStyle())
                         .frame(width: 50)
                         .multilineTextAlignment(.center)
                         .modifier(OtpModifer(pin:$pinThree))
                         .keyboardType(.numberPad)
                         .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2) // Set the border color and width
                         )
                         .modifier(OtpModifer(pin:$pinThree))
                         .onChange(of:pinThree){newVal in
                             if (newVal.count == 1) {
                                 pinFocusState = .pinFour
                             }else {
                                 if (newVal.count == 0) {
                                     pinFocusState = .pinTwo
                                 }
                             }
                         }
                         .focused($pinFocusState, equals: .pinThree)
                     
                     TextField("", text:$pinFour)
                         .textFieldStyle(RoundedBorderTextFieldStyle())
                         .frame(width: 50)
                         .multilineTextAlignment(.center)
                         .modifier(OtpModifer(pin:$pinFour))
                         .keyboardType(.numberPad)
                         .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2) // Set the border color and width
                         )
                         .modifier(OtpModifer(pin:$pinFour))
                         .onChange(of:pinFour){newVal in
                             if (newVal.count == 1) {
                                 pinFocusState = .pinFive
                             }else {
                                 if (newVal.count == 0) {
                                     pinFocusState = .pinThree
                                 }
                             }
                         }
                         .focused($pinFocusState, equals: .pinFour)
                     
                     TextField("", text:$pinFive)
                         .textFieldStyle(RoundedBorderTextFieldStyle())
                         .frame(width: 50)
                         .multilineTextAlignment(.center)
                         .modifier(OtpModifer(pin:$pinFive))
                         .keyboardType(.numberPad)
                         .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2) // Set the border color and width
                         )
                         .modifier(OtpModifer(pin:$pinFive))
                         .onChange(of:pinFive){newVal in
                             if (newVal.count == 1) {
                                 pinFocusState = .pinSix
                             }else {
                                 if (newVal.count == 0) {
                                     print("hello")
                                     pinFocusState = .pinFour
                                 }
                             }
                         }
                         .focused($pinFocusState, equals: .pinFive)
                     
                     //                         TextField("", text:$pinSix)
                     //                             .textFieldStyle(RoundedBorderTextFieldStyle())
                     //                             .frame(width: 50)
                     //                             .multilineTextAlignment(.center)
                     //                             .modifier(OtpModifer(pin:$pinSix))
                     //                             .keyboardType(.numberPad)
                     //                             .overlay(
                     //                                             RoundedRectangle(cornerRadius: 8)
                     //                                                 .stroke(Color.black, lineWidth: 2) // Set the border color and width
                     //                             )
                     //
                     //                             .modifier(OtpModifer(pin:$pinSix))
                     //                             .onChange(of:pinSix){newVal in
                     //
                     //                                 if (newVal.count == 0) {
                     //                                     pinFocusState = .pinFive
                     //
                     //                                 }
                     //                                 else{
                     //                                     print("Hello")
                     //                                 }
                     //
                     //                                 otpcode += pinOne
                     //                                 print(otpcode)
                     //
                     //                             }
                     //                             .focused($pinFocusState, equals: .pinSix)
                     TextField("", text:$pinSix)
                         .textFieldStyle(RoundedBorderTextFieldStyle())
                         .modifier(OtpModifer(pin:$pinSix))
                         .keyboardType(.phonePad)
                         .onChange(of:pinSix){newVal in
                             if (newVal.count == 0) {
                                 pinFocusState = .pinFive
                             }
                             else
                             {
                                 print("helooooo")
                                 //                                     enteredOTP = "\(pinOne)\(pinTwo)\(pinThree)\(pinFour)\(pinFive)\(pinSix)"
                                 //                                     print("\(enteredOTP)")
                                 //                                     Task{
                                 //                                         await verifyToken()
                                 //                                     }
                             }
                             
                         }
                 })
                        }
                     .padding(.vertical)

             }
                        

         }
         
     }
    


//otpcode = "\(pinOne)\(pinTwo)\(pinThree)\(pinFour)\(pinFive)\(pinSix)
#Preview {
    OTPScreen(otpcode: "123456", e164PhoneNumber:"+15005551234")
}

//                 Button(action: {otpcode = "\(pinOne)\(pinTwo)\(pinThree)\(pinFour)\(pinFive)\(pinSix)"}, label: {
//                     Spacer()
//                     Text("VERIFY")
//                         .font(.system(.title3, design: .rounded))
//                         .fontWeight(.semibold)
//                         .foregroundColor(.white)
//                     Spacer()
//                 })
//                 .padding(15)
//                 .background(Color.blue)
//                 .clipShape(Capsule())
//                 .padding()


//                 .navigationDestination
