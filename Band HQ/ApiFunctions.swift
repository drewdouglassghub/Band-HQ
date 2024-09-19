//
//  ApiFunctions.swift
//  Band HQ
//
//  Created by douglass fam on 9/12/24.
//

import Foundation
import SwiftUI
import Alamofire

class ApiFunctions {
	static let functions = ApiFunctions()
	

	
	func getUser(appleId: String, completion: User) {
		
//		schema.pre('save', async function() {
//		  await doStuff();
//		  await doMoreStuff();
//		});
		var user = User()
		
		AF.request("http://192.168.4.32:8081/users/getUser",
				   method: .get,
				   encoding: URLEncoding.httpBody,
				   headers: ["appleId": appleId])
		//.responseDecodable(of: User.self) { response in
		.response { response in
		switch response.result{
			case .success(_):
				
			let dataString = String(data: response.data!, encoding: .utf8)
			print("Data \(String(describing: dataString))")
			
			let decoder = JSONDecoder()
			let JSONData = dataString!.data(using: .utf8)
			let user = try! decoder.decode(User.self, from: JSONData!)
			completion.appleId = user.appleId
			completion.firstName = user.firstName
			completion.lastName = user.lastName
			completion.email = user.email
			completion.bands = user.bands
				//		user.firstName =
				//					user.lastName
				//					user.email
				print("EMAIL \(completion.email)")
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}
	
	func addUser(appleId: String, firstName: String, lastName: String, email: String) {
		
		AF.request("http://192.168.4.32:8081/users/addUser",
				   method: .post,
				   encoding: URLEncoding.httpBody,
				   headers: ["appleId": appleId, "firstName": firstName, "lastName": lastName, "email": email])
		.response {
			response in
			print("User: \(response.data)")

		}
	}
	
	func getUserBand(bandId: String, completion: Band){
		AF.request("http://192.168.4.32:8081/bands/getBand",	
				   method: .post,
				   encoding: URLEncoding.httpBody,
				   headers: ["_id": bandId])
			.responseDecodable(of: Band.self) { response in
				switch response.result{
				case .success(_):
					
					let dataString = String(data: response.data!, encoding: .utf8)
					print("Data \(String(describing: dataString))")
					
					let decoder = JSONDecoder()
					let JSONData = dataString!.data(using: .utf8)
					let band = try! decoder.decode(Band.self, from: JSONData!)
					completion._id = band._id
					completion.bandName = band.bandName
					completion.members = band.members
					completion.email = band.email
					print("EMAIL \(completion.email)")
				case .failure(let error):
					print(error.localizedDescription)
				}
			}
	}
	
	func addBand(bandName: String, members: [User], email: String, completion: Band) {
		
		AF.request("http://192.168.4.32:8081/bands/addBand",
				   method: .post,
				   encoding: URLEncoding.httpBody,
				   headers: ["bandName": bandName, "members": members[0]._id, "email": email])
		.response {
			response in
			print("Band: \(response.data)")
			let dataString = String(data: response.data!, encoding: .utf8)
			print("Data \(String(describing: dataString))")
			
			let decoder = JSONDecoder()
			let JSONData = dataString!.data(using: .utf8)
			let band = try! decoder.decode(Band.self, from: JSONData!)
			completion.bandName = band.bandName
			completion.members = band.members
			completion.email = band.email
			
		}
	}
	
	func deleteBand(offsets: IndexSet) {
		withAnimation {
			Text("Deleted")
	//		for index in offsets {
	//			.delete(currentUser.bands[index])
	//		}
		}
	}
}
