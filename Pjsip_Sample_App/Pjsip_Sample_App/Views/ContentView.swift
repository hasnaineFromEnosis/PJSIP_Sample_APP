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
            LoginView()
        }
        .popover(isPresented: $callingManager.incomingCallComing) {
            IncomingCallView()
        }
    }
}

#Preview {
    ContentView()
}
