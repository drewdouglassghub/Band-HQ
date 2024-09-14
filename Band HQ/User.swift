//
//  User.swift
//  Band HQ
//
//  Created by douglass fam on 9/12/24.
//

import Foundation
import SwiftUI

@Observable
class User: Codable {
	enum CodingKeys:String, CodingKey {
		case _id = "_id"
		case appleId = "appleId"
		case firstName = "firstName"
		case lastName =  "lastName"
		case email = "email"
		}
	var _id: String
	var appleId: String
	var firstName: String
	var lastName: String
	var email: String

	init() {
		self._id = ""
		self.appleId = ""
		self.firstName = ""
		self.lastName = ""
		self.email = ""
	}
	
	init(_id: String, appleId: String, firstName: String, lastName: String, email: String) {
		self._id = _id
		self.appleId = appleId
		self.firstName = firstName
		self.lastName = lastName
		self.email = email
	}

		func encode(to encoder: Encoder) throws {
			var container = encoder.container(keyedBy: CodingKeys.self)
			try container.encode(_id, forKey: ._id)
			try container.encode(appleId, forKey: .appleId)
			try container.encode(firstName, forKey: .firstName)
			try container.encode(lastName, forKey: .lastName)
			try container.encode(email, forKey: .email)
		}
	
	func decode(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		_id = try container.decode(String.self, forKey: ._id)
		appleId = try container.decode(String.self, forKey: .appleId)
		firstName = try container.decode(String.self, forKey: .firstName)
		lastName = try container.decode(String.self, forKey: .lastName)
		email = try container.decode(String.self, forKey: .email)
	}
		
		required init(from decoder: Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)
			_id = try container.decode(String.self, forKey: ._id)
			appleId = try container.decode(String.self, forKey: .appleId)
			firstName = try container.decode(String.self, forKey: .firstName)
			lastName = try container.decode(String.self, forKey: .lastName)
			email = try container.decode(String.self, forKey: .email)
		}
}
