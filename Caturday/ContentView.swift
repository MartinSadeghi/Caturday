//
//  ContentView.swift
//  Caturday
//
//  Created by Mommo Sadeghi on 19/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var breedFetcher = BreedFetcher()
    
    var body: some View {
        if breedFetcher.isLoading {
            LoadingView()
        } else if breedFetcher.errorMessage != nil {
            ErrorView()
        } else {
            BreedListView(breeds: breedFetcher.breeds)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
