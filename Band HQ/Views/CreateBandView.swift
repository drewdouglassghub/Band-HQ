//
//  CreateBandView.swift
//  Band HQ
//
//  Created by douglass fam on 9/18/24.
//

import SwiftUI

struct CreateBandView: View {
	@Environment(\.colorScheme) var colorScheme
	@ObservedObject var currentUser: User
	@ObservedObject var currentBand: Band
	
	let gradientColors: [Color] = [
		.gradientTop,
		.gradientMiddle1,
		.gradientMiddle2,
		.gradientBottom
	]
	
    var body: some View {
		NavigationView {
			VStack{
				TextField("Band Name", text: $currentBand.bandName)
					.padding(.all, 20.0)
				TextField("email", text: $currentBand.email)
					.padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
				Button(action: {createBand(currentBand: currentBand, currentUser: currentUser)}) {
					Image(systemName: "plus.circle")
					Text("Create")
						.padding(.horizontal)
				}
				.padding()
				.background(.blue)
				.foregroundColor(.white)
				.cornerRadius(10)
			}
			.navigationTitle("Create Band")
			.navigationBarTitleDisplayMode(.inline)
			.frame(maxWidth: .infinity, maxHeight: .infinity).background {
				LinearGradient(colors: gradientColors, startPoint: .top, endPoint: .bottom)
					.opacity(0.9)
					.ignoresSafeArea()
			}
			
		}
		.font(.title3)
	}

//	.toolbar{
//		addBandBtn
//	}

}


func createBand(currentBand: Band, currentUser: User) {
	ApiFunctions.functions.addBand(bandName: currentBand.bandName, members: [currentUser], email: currentBand.email, completion: currentBand)
	HomeView(currentUser: currentUser, currentBand: currentBand)
}


#Preview {
	CreateBandView(currentUser: User(), currentBand: Band())
}
