//
//  IncomingCallView.swift
//  Pjsip_Sample_App
//
//  Created by Shahwat Hasnaine on 7/8/24.
//

import SwiftUI

struct IncomingCallView: View {
    
    @ObservedObject var callingManager: CallingManagers = CallingManagers.shared
    
    var body: some View {
        VStack {
            VStack {
                Text(callingManager.incomingCallID)
            }
            
            Spacer()
            
            HStack {
                Button {
                    
                } label: {
                    Text("Reject")
                }
                
                Button {
                    
                } label: {
                    Text("Answer")
                }
            }
        }
    }
}

#Preview {
    IncomingCallView()
}
