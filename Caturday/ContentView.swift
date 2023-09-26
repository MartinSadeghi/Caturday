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
            // Pass the same instance
            ErrorView(breedFetcher: breedFetcher)
        } else {
            BreedListView(breeds: breedFetcher.breeds)
        }
    }
}


// In this version, while second if excutes I create the new instance of breedFecher which is not correct(it will print the data but the data is not shown in the List).

//struct ContentView: View {
//    @StateObject var breedFetcher = BreedFetcher()
//
//    var body: some View {
//        if breedFetcher.isLoading {
//            LoadingView()
//        } else if breedFetcher.errorMessage != nil {
//            ErrorView(breedFetcher: BreedFetcher())
//        } else {
//            BreedListView(breeds: breedFetcher.breeds)
//        }
//    }
//}
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

