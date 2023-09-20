//
//  LoadingView.swift
//  Caturday
//
//  Created by Mommo Sadeghi on 19/09/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Text("😺")
                .font(.system(size: 45))
            ProgressView()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
