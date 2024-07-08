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

func call_status_listener_swift ( call_answer_code: Int32) {
    if (call_answer_code == 0) {

    } else if (call_answer_code == 1) {
        
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
    
    @Published var outgoingCallID: String = ""
    @Published var outgoingCallGoing: Bool = false
    
    @Published var isCallRunning: Bool = false
    
    @Published var isCallOnHold: Bool = false
    
    func logIn() {
        CPPWrapper().createAccountWrapper(self.userName,
                                          self.password, 
                                          self.domain,
                                          self.port)
    }
    
    func logOut() {
        CPPWrapper().unregisterAccountWrapper()
    }
    
    func initiateCall() {
        let fullCallURI: String = "sip:" + outgoingCallID + "@" + domain
        CPPWrapper().outgoingCall(fullCallURI)
        CPPWrapper().call_listener_wrapper(call_status_listener_swift)
    }
    
    func answerCall() {
        CPPWrapper().answerCall()
        self.isCallRunning = true
        self.incomingCallComing = false
        self.outgoingCallGoing = false
    }
    
    func holdCall() {
        if self.isCallOnHold {
            CPPWrapper().unholdCall()
        } else {
            CPPWrapper().holdCall()
        }
        
        self.isCallOnHold = !self.isCallOnHold
    }
    
    func hangupCall() {
        CPPWrapper().hangupCall()
        self.isCallRunning = false
    }
}
