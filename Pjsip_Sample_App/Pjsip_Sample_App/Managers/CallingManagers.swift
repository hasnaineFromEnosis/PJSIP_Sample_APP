//
//  CallingManagers.swift
//  Pjsip_Sample_App
//
//  Created by Shahwat Hasnaine on 7/5/24.
//

import UIKit

func acc_listener_swift(status: Bool) {
    DispatchQueue.main.async {
        if status {
            print("Logged in succesfully")
        } else {
            print("Cannot log in")
        }
        
        CallingManagers.shared.loggedIn = status
    }
}

func incoming_call_swift() {
    DispatchQueue.main.async {
        CallingManagers.shared.incomingCallComing = true
        CallingManagers.shared.incomingCallID = CPPWrapper().incomingCallInfoWrapper()
    }
}

class CallingManagers: ObservableObject {
    
    static let shared: CallingManagers = CallingManagers()
    
    @Published var loggedIn: Bool = false
    
    @Published var userName: String = "339740bf"
    @Published var domain: String = "pbn-voipqa-1-2c.practicebynumber.com"
    @Published var password: String = "a0025437"
    @Published var port: String = "5060"
    @Published var proxyAddress: String = "sipproxy.us-east-1.dev.pbn-dev.com"
    
    @Published var incomingCallComing: Bool = false
    @Published var incomingCallID: String = ""
    
    func logIn() {
        CPPWrapper().createAccountWrapper(self.userName,
                                          self.password, 
                                          self.domain,
                                          self.port)
    }
}
