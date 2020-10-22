//
//  Contact+Helpers.swift
//  Contacts-SwiftUI
//
//  Created by Glenn Posadas on 10/23/20.
//

import CoreData
import SwiftUI

extension Contact {
    var profilePictureImage: Image {
        guard let profilePicture = self.profilePicture,
              let data = Data(base64Encoded: profilePicture),
              let uiImage = UIImage(data: data) else {
            return Image("ic_person_blank")
        }
        
        return Image(uiImage: uiImage)
    }
}
