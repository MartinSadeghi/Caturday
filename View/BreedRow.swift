//
//  BreedRow.swift
//  Caturday
//
//  Created by Mommo Sadeghi on 20/09/23.
//

import SwiftUI

struct BreedRow: View {
    let breed: Breed
    let imageSize: CGFloat = 100
    
    var body: some View {
        HStack {
            if breed.image?.url != nil {
                AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipped()
                    } else if phase.error != nil {
                        Color.red.frame(width: imageSize, height: imageSize)                    } else {
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    }
                }
            } else {
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(breed.name ?? "")
                    .font(.headline)
                Text(breed.temperament ?? "")
                    .lineLimit(2)
            }
        }
    }
}

struct BreedRow_Previews: PreviewProvider {
    static var previews: some View {
        BreedRow(breed: BreedExamples.example1())
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
