//
//  ErrorView.swift
//  Caturday
//
//  Created by Mommo Sadeghi on 19/09/23.
//

import SwiftUI


struct ErrorView: View {
    @ObservedObject var breedFetcher: BreedFetcher
    var body: some View {
        VStack {
            Text("😿")
                .font(.system(size: 65))
            Text(breedFetcher.errorMessage ?? "")
            Button {
                breedFetcher.fetchAllBreeds()
            } label: {
                 Text("Try again!")
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(breedFetcher: BreedFetcher())
    }
}
