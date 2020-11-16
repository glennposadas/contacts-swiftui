//
//  ContactRow.swift
//  Contacts-SwiftUI
//
//  Created by Glenn Von Posadas on 10/12/20.
//

import SwiftUI

struct ContactRow: View {
    
    // MARK: - Properties
    
    var contact: Contact
    
    // MARK: - Body

    var body: some View {
        HStack {
            self.contact.profilePictureImagePresentable
                .renderingMode(.template)
                .foregroundColor(.white)
                .frame(width: 70, height: 70, alignment: .center)
                .background(Color.blue)
                .cornerRadius(35)
            VStack(alignment: .leading, spacing: 0) {
                Text(self.contact.fullNamePresentable)
                Text(self.contact.contactNumberPresentable)
            }
        }
    }
}

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactRow(contact: Contact())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
