//
//  BreedListView.swift
//  Caturday
//
//  Created by Mommo Sadeghi on 19/09/23.
//

import SwiftUI

struct BreedListView: View {
    let breeds: [Breed]
    @State private var searchText = ""
    
    
    var filteredBreeds: [Breed] {
        if searchText.count == 0 {
            return breeds
        } else {
            return breeds.filter {
                $0.name!.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredBreeds) { breed in
                    NavigationLink {
                        BreedDetailView(breed: breed)
                    } label: {
                        BreedRow(breed: breed)

                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Find your favorite cat")
            .searchable(text: $searchText)
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
