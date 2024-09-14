//
//  HomeView.swift
//  Band HQ
//
//  Created by douglass fam on 9/12/24.
//

import SwiftUI

struct HomeView: View {
	@Environment(User.self) var currentUser
	
    var body: some View {
		Text("Hello \(currentUser.firstName)")
    }
	
}

#Preview {
    HomeView()
}
