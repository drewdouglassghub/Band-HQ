//
//  HomeView.swift
//  Band HQ
//
//  Created by douglass fam on 9/12/24.
//

import SwiftUI

struct HomeView: View {
	@Environment(\.colorScheme) var colorScheme
	@ObservedObject var currentUser: User
	@ObservedObject var currentBand: Band
	
	var bandId: String = ""
	
	let gradientColors: [Color] = [
		.gradientTop,
		.gradientMiddle1,
		.gradientMiddle2,
		.gradientBottom
	]
	
	var body: some View {
		NavigationView {
			VStack(alignment: .leading, spacing: 0.0) {
				Section(header: Text("Personal Info")
					
					) {
					VStack{
						//Spacer().frame(width: 0, height: 200.0, alignment: .trailing)
						Text("First Name: \(currentUser.firstName)")
						Text("Last Name:  \(currentUser.lastName)")
						Text("Email: \(currentUser.email)")
						BandListView(currentUser: currentUser, currentBand: currentBand)
					}
				}
				.padding(.bottom, 50.0)
				.accessibilityLabel("Label")
			}
			.navigationTitle("Band HQ")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar{
				addBandBtn
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity).background {
				LinearGradient(colors: gradientColors, startPoint: .top, endPoint: .bottom)
					.opacity(0.9)
					.ignoresSafeArea()
			}
		}
	}
}
	
	var addBandBtn: some View {
		NavigationLink("Add Band", destination: CreateBandView(currentUser: User(), currentBand: Band()))
		.accessibilityLabel("Add Band")}

#Preview {
	HomeView(currentUser: User(), currentBand: Band())
}
