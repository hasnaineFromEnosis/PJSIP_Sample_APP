//
//  OutgoingCallView.swift
//  Pjsip_Sample_App
//
//  Created by Shahwat Hasnaine on 7/8/24.
//

import SwiftUI

struct OutgoingCallView: View {
    @ObservedObject var callingManager: CallingManagers = CallingManagers.shared
    
    var body: some View {
        VStack {
            VStack {
                Text(callingManager.outgoingCallID)
            }
            
            Spacer()
            
            HStack {
                Button {
                    callingManager.hangupCall()
                } label: {
                    Text("Cancel")
                }
            }
        }
    }
}

#Preview {
    OutgoingCallView()
}
