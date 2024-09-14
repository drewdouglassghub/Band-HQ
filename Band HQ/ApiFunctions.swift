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
		var user = User()
		
		AF.request("http://192.168.4.32:8081/getUser",
				   method: .get,
				  encoding: URLEncoding.httpBody,
				  headers: ["appleId": appleId])
		.responseDecodable(of: User.self) { response in
				switch response.result{
				case .success(let data):
					
					let dataString = String(data: response.data!, encoding: .utf8)
					print("Data \(String(describing: dataString))")
					
					let decoder = JSONDecoder()
					let JSONData = dataString!.data(using: .utf8)
					let user = try! decoder.decode(User.self, from: JSONData!)
					completion.appleId = user.appleId
					completion.firstName = user.firstName
					completion.lastName = user.lastName
					completion.email = user.email
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

	AF.request("http://192.168.4.32:8081/addUser",
				method: .post,
			   encoding: URLEncoding.httpBody,
			   headers: ["appleId": appleId, "firstName": firstName, "lastName": lastName, "email": email])
	.response {
		response in
		print("User: \(response.data)")
			//debugPrint("addUser \(response)")
	
		//let data = String(data: response.data!, encoding: .utf8)
		//_ = User(_id: "", appleId: appleId, firstName:firstName, lastName:lastName, email:email)
		
		
//			self.delegate?.updateArray(newArray: data!
		//updateArray.append(data)
	}
}
	
//	func getUser(appleId: String, completion: User) -> User {
//		var user = User()
//		AF.request("http://192.168.4.32:8081/getUser",
//			   method: .get,
//			  encoding: URLEncoding.httpBody,
//			  headers: ["appleId": appleId])
//		.response{ response in
//				switch response.result{
//				case .success(let data):
//					
//					let dataString = String(data: response.data!, encoding: .utf8)
//					print("Data \(dataString)")
//					do {
//					
//						let decoder = JSONDecoder()
//						let user =	try decoder.decode(User.self, from: dataString!.data(using: .utf8)!)
//
//					} catch {
//						print("failed to decode user: \(user.firstName)")
//					}
//				case .failure(_):
//					print("Request to DB failed")
//				}
//			}
//		return user
//	}
//	
//	func addUser(currentUser: User) {
//		print("adding \(currentUser.firstName)")
//	}
}
