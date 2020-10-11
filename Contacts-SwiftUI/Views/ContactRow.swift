//
//  ContactRow.swift
//  Contacts-SwiftUI
//
//  Created by Glenn Von Posadas on 10/12/20.
//

import SwiftUI

struct ContactRow: View {
    
    // MARK: - Properties
    
    
    // MARK: - Body

    var body: some View {
        HStack {
            Image(decorative: "fafa")
        }
    }
}

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactRow()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
