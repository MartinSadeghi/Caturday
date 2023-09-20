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
        NavigationView {
            List {
                ForEach(breeds) { breed in
                    NavigationLink {
                        BreedDetailView(breed: breed)
                    } label: {
                        BreedRow(breed: breed)

                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Find your favorite cat")
        }
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: BreedFetcher.successState().breeds)
    }
}

//struct BreedListView_Previews: PreviewProvider {
//    static var previews: some View {
//        BreedListView(breeds: [Breed]())
//    }
//}
