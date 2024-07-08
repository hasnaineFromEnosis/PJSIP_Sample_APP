//
//  LoginView.swift
//  Pjsip_Sample_App
//
//  Created by Shahwat Hasnaine on 7/5/24.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var callingManager: CallingManagers = CallingManagers.shared
    
    var body: some View {
        Form {
            Section("User Info") {
                TextField("Username", text: $callingManager.userName)
                TextField("Password", text: $callingManager.password)
                TextField("Domain", text: $callingManager.domain)
                TextField("Port", text: $callingManager.port)
            }
            
            Section {
                Button {
                    callingManager.logIn()
                } label: {
                    Text(callingManager.loggedIn ? "Logout" : "Login")
                }
            }
        }
        .scrollDismissesKeyboard(.immediately)
        .navigationTitle("PJSIP")
    }
}

#Preview {
    LoginView()
}
