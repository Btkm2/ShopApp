//
//  LoginPageView.swift
//  ShopApp
//
//  Created by Beket Muratbek on 14.03.2023.
//

import SwiftUI

struct LoginPageView: View {
    @State private var first_name = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Text("Welcome back")
                .font(.system(size: 30, weight: .medium, design: .default))
            TextFieldView(placeholder_text: "First name", binding_var: $first_name)
                .keyboardType(.default)
            SecureField("Password", text: $password)
                .keyboardType(.asciiCapable) // Turns off suggestion on keyboard
                .padding([.leading, .trailing])
                .textFieldStyle(OvalTextField())
                .overlay(alignment:.trailing, content: {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "eye.slash")
                            .padding(.trailing, 28) // Change according to Figma design
                            .foregroundColor(Color.black)
                    })
                })
            Button(action: {
                
            }, label: {
                Text("Login")
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width*0.92, height: 50)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .padding(.top, 20)
            })
        }
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
