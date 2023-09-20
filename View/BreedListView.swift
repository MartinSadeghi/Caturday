//
//  BreedListView.swift
//  Caturday
//
//  Created by Mommo Sadeghi on 19/09/23.
//

import SwiftUI

struct BreedListView: View {
    let breeds: [Breed]
    var body: some View {
        List {
            ForEach(breeds) { breed in
                Text(breed.name ?? "")
            }
        }
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: [Breed]())
    }
}
