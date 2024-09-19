//
//  BandListView.swift
//  Band HQ
//
//  Created by douglass fam on 9/17/24.
//

import SwiftUI

struct BandListView: View {
	@Environment(\.colorScheme) var colorScheme
	@ObservedObject var currentUser: User
	@ObservedObject var currentBand: Band
	
    var body: some View {
		var bands: [Band] = getBandList(currentUser: currentUser, currentBand: currentBand)
	
		
		Text("BAND")
    }
}

func getBandList(currentUser: User, currentBand: Band ) -> [Band]{
	var bands: [Band] = []
	for band in currentUser.bands {
		ApiFunctions.functions.getUserBand(bandId: band._id, completion: currentBand)
		
		bands.append(currentBand)
		print(currentBand.bandName)
		createBandList(bands: bands)
	}
	return bands
}

func createBandList(bands: [Band]){
	
	ForEach(bands) { band in
		NavigationLink (destination: ContentView()){
			Text(band.bandName)
				.navigationTitle("Band")
		}
	}
}

#Preview {
    BandListView(currentUser: User(), currentBand: Band())
}
