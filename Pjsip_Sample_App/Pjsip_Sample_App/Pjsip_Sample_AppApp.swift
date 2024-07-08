//
//  Pjsip_Sample_AppApp.swift
//  Pjsip_Sample_App
//
//  Created by Shahwat Hasnaine on 7/4/24.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        //Create Lib
        CPPWrapper().createLibWrapper()

        //Listen incoming call via function pointer
        CPPWrapper().incoming_call_wrapper(incoming_call_swift)

        //Listen incoming call via function pointer
        CPPWrapper().acc_listener_wrapper(acc_listener_swift)

        //CPPWrapper().update_video_wrapper(update_video_swift)

        return true
    }
}

@main
struct Pjsip_Sample_AppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
