Overview
This SwiftUI project is designed to implement a phone number verification system. The app sends a verification code to the user's phone number, and the user must enter the code to proceed. The app utilizes SwiftUI's NavigationStack for seamless navigation between different views.

Components
LoginView

Accepts the user's phone number input.
Sends a verification code using the provided API.
Navigates to the VerificationView upon successful submission.
VerificationView

Displays instructions for entering the verification code.
Implements an OTP-style text field for entering the code.
Includes a resend button for re-sending verification codes.
Auto-verifies the code and navigates to the Home View upon correct entry.
Api.swift

Provides API functionality for sending and verifying verification codes.
Uses the appId for authentication.
Navigation
Login to Verification:

Use NavigationLink to move from LoginView to VerificationView upon successful phone number submission.
Auto-Verification:

VerificationView auto-verifies the code upon complete entry, without the need for a "Next" button.
Testing
Test Numbers:
Test numbers with the area code 500 do not send actual SMS; the default verification code is 123456.
Setup
API Configuration:

Open Api.swift and set the appId in the constructor.
Resend Functionality:

The resend button in VerificationView triggers the API to resend the verification code.
Error Handling:

Appropriate error messages are displayed in both views for user guidance.
