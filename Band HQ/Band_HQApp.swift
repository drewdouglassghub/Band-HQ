//
//  Band_HQApp.swift
//  Band HQ
//
//  Created by douglass fam on 9/12/24.
//

import SwiftUI

@main
struct Band_HQApp: App {
	@StateObject private var currentUser = User()
	@StateObject private var currentBand = Band()
	
	  init() {
	      let currentUser = User()
	      _currentUser = StateObject(wrappedValue: currentUser)
	  }
	
    var body: some Scene {
        WindowGroup {
			if(currentUser.appleId == ""){
				SignInView(currentUser: currentUser)
							.environmentObject(currentUser)
							.environmentObject(currentBand)
						} else {
							HomeView(currentUser: currentUser, currentBand: currentBand)
							.environmentObject(currentUser)
							.environmentObject(currentBand)
						}
        }
    }
}
