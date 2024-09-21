//
//  EmptyWatchListView.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import SwiftUI

struct EmptyWatchListView: View {
    var body: some View {
      ZStack {
        Color.theme.backgroundColor.ignoresSafeArea()
        VStack {
          Image("emptyBox", bundle: .main)
          Text("There is No Movie Yet!")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.theme.primaryColor)
            .multilineTextAlignment(.center)
            .padding(.top, 10)
          Text("Find your movie by Type title.")
            .foregroundStyle(Color.theme.secondaryColor)
            .multilineTextAlignment(.center)
            .padding(.top, 10)
        }
      }
    }
}

/*
#Preview {
    EmptyWatchListView()
}
*/
