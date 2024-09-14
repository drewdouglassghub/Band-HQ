//
//  Band_HQApp.swift
//  Band HQ
//
//  Created by douglass fam on 9/12/24.
//

import SwiftUI

@main
struct Band_HQApp: App {
	@State private var currentUser = User()
	
    var body: some Scene {
        WindowGroup {
			if(currentUser.appleId == ""){
							SignInView()
							.environment(currentUser)
						} else {
							HomeView()
							.environment(currentUser)
						}
        }
    }
}
