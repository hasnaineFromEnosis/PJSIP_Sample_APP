//
//  ActiveCallView.swift
//  Pjsip_Sample_App
//
//  Created by Shahwat Hasnaine on 7/8/24.
//

import SwiftUI

struct ActiveCallView: View {
    @ObservedObject var callingManager: CallingManagers = CallingManagers.shared
    
    var body: some View {
        VStack {
            VStack {
                Text(callingManager.incomingCallID)
            }
            
            Spacer()
            
            HStack {
                Button {
                    callingManager.hangupCall()
                } label: {
                    Text("Reject")
                }
                
                Button {
                    callingManager.holdCall()
                } label: {
                    Text(callingManager.isCallOnHold ? "Unhold" : "Hold")
                }
            }
        }
    }
}

#Preview {
    ActiveCallView()
}
