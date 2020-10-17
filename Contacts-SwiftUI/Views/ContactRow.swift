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
            Image("ic_person_blank")
                .renderingMode(.template)
                .foregroundColor(.white)
                .frame(width: 80, height: 80, alignment: .center)
                .background(Color.blue)
                .cornerRadius(40)
            VStack(alignment: .leading, spacing: 0) {
                Text("Person name")
                Text("Contact number")
            }
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
