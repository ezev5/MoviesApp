//
//  CustomTabBarView.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import SwiftUI

struct CustomTabBarView: View {
  let tabs: [TabBarItem]
  @Binding var selection: TabBarItem
  
  var body: some View {
    HStack {
      ForEach(tabs, id: \.self) { tab in
        tabView(tab: tab)
          .onTapGesture {
            switchToTab(tab: tab)
          }
      }
    }
    .padding(.vertical, 2)
    .background(Color.theme.backgroundColor)
    .overlay(
      EdgeBorder(
        width: 2,
        edges: [.top]
      )
      .foregroundColor(Color.theme.accent)
    )
  }
}

extension CustomTabBarView {
  private func tabView(tab: TabBarItem) -> some View {
    VStack {
      Image(systemName: tab.iconName)
        .font(.title3)
      Text(tab.title)
        .font(.system(size: 12, weight: .semibold, design: .rounded))
        .padding(.top, 2)
    }
    .foregroundColor(selection == tab ? Color.theme.accent: Color.theme.secondaryColor)
    .padding(.vertical, 8)
    .frame(maxWidth: .infinity)
    .cornerRadius(10)
  }
  
  private func switchToTab(tab: TabBarItem) {
    withAnimation(.easeInOut) {
      selection = tab
    }
  }
}
/*
#Preview {
  
  CustomTabBarView(tabs: [
    TabBarItem(iconName: "house", title: "Mome", color: Color.theme.accent),
    TabBarItem(iconName: "magnifyingglass", title: "Search", color: Color.theme.accent),
    TabBarItem(iconName: "bookmark", title: "Watch List", color: Color.theme.accent)
  ])
}*/

struct EdgeBorder: Shape {
  var width: CGFloat
  var edges: [Edge]
  
  func path(in rect: CGRect) -> Path {
    edges.map { edge -> Path in
      switch edge {
      case .top: return Path(.init(x: rect.minX, y: rect.minY, width: rect.width, height: width))
      case .bottom: return Path(.init(x: rect.minX, y: rect.maxY - width, width: rect.width, height: width))
      case .leading: return Path(.init(x: rect.minX, y: rect.minY, width: width, height: rect.height))
      case .trailing: return Path(.init(x: rect.maxX - width, y: rect.minY, width: width, height: rect.height))
      }
    }.reduce(into: Path()) { $0.addPath($1) }
  }
}
