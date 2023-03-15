//
//  ContentView.swift
//  ShopApp
//
//  Created by Beket Muratbek on 14.03.2023.
//

import SwiftUI

struct SignInPageView: View {
    @State private var first_name = ""
    @State private var last_name = ""
    @State private var email = ""
    @State var login_page_transition = false
    var f_name_str: String = "First name"
    var body: some View {
        if login_page_transition {
            withAnimation(.easeIn(duration: 1.0)) {
                LoginPageView()
            }
        }
        else {
            VStack {
                Text("Sign in")
                    .font(.system(size: 30, weight: .medium, design: .default)) //Change accprding to Figma desing
                VStack(spacing: 5) {
                    TextFieldView(placeholder_text: "First Name", binding_var: $first_name)
                    TextFieldView(placeholder_text: "Last Name", binding_var: $last_name)
                    TextFieldView(placeholder_text: "Email", binding_var: $email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .onSubmit {
                            print(email)
                        }
                }
                VStack(alignment: .leading) {
                    Button(action: {
                        // Transition to main screen with TabBar
                    },label: {
                        Text("Sign in")
                            .font(.system(size: 20, weight: .medium, design: .default))
                            .foregroundColor(Color.white)
                            .frame(width: UIScreen.main.bounds.width*0.91, height: 60)
                        //                        .border(Color.green)
                            .background(Color.blue)
                            .cornerRadius(20)
                    })
                    HStack {
                        Text("Already have account?")
                        Button(action: {
                            // Transition to Login page
                            login_page_transition = true
                            print(login_page_transition)
//                            SwitchToLoginPage(triggerIsTrue: login_page_transition)
                        }, label: {
                            Text("Log in")
                        })
                    }.font(.system(size: 12, weight: .medium, design: .default))
                }
                VStack {
                    SocialNetworksSignInButtonView(social_network_name: "Sign in with Google")
                    SocialNetworksSignInButtonView(social_network_name: "Sign in with Apple")
                }
                .padding(.top, 10)
            }
        }
    }
}

struct SignInPageView_Previews: PreviewProvider {
    static var previews: some View {
        SignInPageView()
    }
}

struct OvalTextField: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding() // Change according to Figma design
            .background(Color.gray)
            .cornerRadius(20)
    }
    
}

struct TextFieldView: View {
    var placeholder_text: String
    @Binding var binding_var: String
    var body: some View {
        TextField(placeholder_text, text: $binding_var)
            .foregroundColor(Color.black)
            .padding()
            .textFieldStyle(OvalTextField())
    }
}

struct SocialNetworksSignInButtonView: View {
    var social_network_name: String
    var body: some View {
        Button(action: {
            
        }, label: {
            Text(social_network_name)
        })
        .padding()
    }
}

func SwitchToLoginPage(triggerIsTrue: Bool) {
    print("From func: \(triggerIsTrue)")
    if triggerIsTrue {
        DispatchQueue.main.async {
            LoginPageView()
        }
    }
}
