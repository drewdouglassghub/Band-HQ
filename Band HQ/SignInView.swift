//
//  SwiftUIView.swift
//  Band HQ
//
//  Created by douglass fam on 9/12/24.
//

import SwiftUI
import AuthenticationServices

struct SignInView: View {
	@Environment(\.colorScheme) var colorScheme
	@Environment(User.self) var currentUser
	
	let gradientColors: [Color] = [
		.gradientTop,
		.gradientMiddle1,
		.gradientMiddle2,
		.gradientBottom
	]
	
	var body: some View {
		@Bindable var currentUser = currentUser
		VStack {
			SignInWithAppleButton(.continue) { request in
				
				request.requestedScopes = [.email, .fullName]
				
			}  onCompletion:  { result in
				switch result {
				case .success(let auth):
					//	.success.identityToken
					switch auth.credential {
					case let credential as ASAuthorizationAppleIDCredential:
						
						//User Id - only thing that comes back after 1st signin
						currentUser.appleId =  credential.user
						currentUser.email = credential.email ?? ""
						currentUser.firstName =  credential.fullName?.givenName ?? ""
						currentUser.lastName =  credential.fullName?.familyName ?? ""
						print("User " + (currentUser.appleId))
						print("Credential RESULT: \(result)")
						
						if(currentUser.email != ""){
							ApiFunctions.functions.addUser(appleId: currentUser.appleId, firstName: currentUser.firstName, lastName: currentUser.lastName, email: currentUser.email)
							
						} else {
							ApiFunctions.functions.getUser(appleId: currentUser.appleId, completion: currentUser)
						}
						
					default:
						break
					}
				case .failure(_):
					print("failure")
				}
			}
					.signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black)
					.frame(height: 50)
					.padding()
					.cornerRadius(8)
			}
			.navigationTitle("Band HQ")
			
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.background {
				LinearGradient(colors: gradientColors, startPoint: .top, endPoint: .bottom)
					.opacity(0.9)
					.ignoresSafeArea()
		}
	}
}
#Preview {
    SignInView()
}
