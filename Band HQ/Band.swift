//
//  Band.swift
//  Band HQ
//
//  Created by douglass fam on 9/14/24.
//

import Foundation
import SwiftUI

//@Observable
class Band: ObservableObject, Identifiable, Codable {
	enum CodingKeys:String, CodingKey {
		case _id = "_id"
		case bandName = "bandName"
		case members = "members"
		case email = "email"
	}
	
	@Published var _id: String
	@Published var bandName: String
	@Published var members: [User]
	@Published var email: String
	
	init() {
		self._id = ""
		self.bandName = ""
		self.members = []
		self.email = ""
	}
	init(_id: String, bandName: String, members: [User], email: String) {
		self._id = _id
		self.bandName = bandName
		self.members = members
		self.email = email
	}
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(_id, forKey: ._id)
		try container.encode(bandName, forKey: .bandName)
		try container.encode(members, forKey: .members)
		try container.encode(email, forKey: .email)
	}
	//
	func decode(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		_id = try container.decode(String.self, forKey: ._id)
		bandName = try container.decode(String.self, forKey: .bandName)
		members = try container.decode([User].self, forKey: .members)
		email = try container.decode(String.self, forKey: .email)
	}
	//
	required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		_id = try container.decode(String.self, forKey: ._id)
		bandName = try container.decode(String.self, forKey: .bandName)
		members = try container.decode([User].self, forKey: .members)
		email = try container.decode(String.self, forKey: .email)
	}
}
