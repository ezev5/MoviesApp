//
//  ContentView.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 18/09/2024.
//

import SwiftUI

struct MainTabView<ViewModel: MainTabViewModelProtocol>: View {
  @ObservedObject var viewModel: ViewModel
  
  var body: some View {
    ZStack(alignment: .bottom) {
      Color.theme.backgroundColor.ignoresSafeArea()
      switch viewModel.tabSelection {
      case .home: HomeWireframe.getView(activeTabIndex: $viewModel.tabSelection)
          .transition(.opacity)
      case .search: SearchViewWireframe.getView()
          .transition(.opacity)
      case .watchList: WatchListWireFrame.getView()
          .transition(.opacity)
      }
      CustomTabBarView(tabs: viewModel.tabs, selection: $viewModel.tabSelection)
      ZStack{
        if viewModel.isLoading {
          SplashView()
            .transition(.opacity)
        }
      }
    }
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        withAnimation(.easeOut(duration: 1)) {
          self.viewModel.isLoading = false
        }
      }
    }
  }
}


#Preview {
  MainTabView(viewModel: MainTabViewModel())
}

