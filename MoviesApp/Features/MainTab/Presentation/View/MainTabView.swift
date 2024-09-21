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
    ZStack {
      if viewModel.isLoading {
        SplashView()
      } else {
        TabView(selection: $viewModel.tabSelection) {
          HomeWireframe.getView(activeTabIndex: $viewModel.tabSelection)
            .tag(TabBarItem.home)
            .transition(.move(edge: .leading))
            .animation(.easeInOut, value: viewModel.tabSelection)
          SearchViewWireframe.getView()
            .tag(TabBarItem.search)
            .transition(.move(edge: .leading))
            .animation(.easeInOut, value: viewModel.tabSelection)
          WatchListWireFrame.getView()
            .tag(TabBarItem.watchList)
            .transition(.move(edge: .leading))
            .animation(.easeInOut, value: viewModel.tabSelection)
        }
        .overlay(alignment: .bottom) {
          CustomTabBarView(tabs: viewModel.tabs, selection: $viewModel.tabSelection)
        }
      }
    }
    .onAppear {
      UITabBar.appearance().backgroundColor = UIColor( Color.theme.backgroundColor)
      UITabBar.appearance().barTintColor = UIColor( Color.theme.secondaryColor)
      //TODO move to VM and animate disappear
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        withAnimation(.easeOut) {
          self.viewModel.isLoading = false
        }
      }
    }
  }
}

/*
#Preview {
  MainTabView(viewModel: MainTabViewModel())
}
*/
