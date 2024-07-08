//
//  ContentView.swift
//  Pjsip_Sample_App
//
//  Created by Shahwat Hasnaine on 7/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var callingManager: CallingManagers = CallingManagers.shared
    var body: some View {
        NavigationStack {
            if callingManager.isCallRunning {
                ActiveCallView()
            } else {
                LoginView()
            }
        }
        .popover(isPresented: $callingManager.incomingCallComing) {
            IncomingCallView()
        }
        .popover(isPresented: $callingManager.outgoingCallGoing) {
            OutgoingCallView()
        }
    }
}

#Preview {
    ContentView()
}
