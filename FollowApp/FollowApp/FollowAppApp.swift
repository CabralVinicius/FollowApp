//
//  FollowAppApp.swift
//  FollowApp
//
//  Created by Vinicius Cabral on 30/12/22.
//

import SwiftUI

@main
struct FollowAppApp: App {
    var body: some Scene {
        WindowGroup {
            ProfileView()
                .environmentObject(ProfileViewModel())
        }
    }
}
