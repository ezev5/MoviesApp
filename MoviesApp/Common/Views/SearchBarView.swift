//
//  SearchBarView.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 20/09/2024.
//

import SwiftUI

struct SearchBarView: View {
  enum FocusField {
    case searchField
  }
  
  @Binding var searchInput: String
  @FocusState private var focusedField: FocusField?
  private var isFocusOnAppear: Bool = false
  
  public init(
    searchInput: Binding<String>,
    focusedField: FocusField? = nil,
    isFocusOnAppear: Bool = false
  ) {
    self._searchInput = searchInput
    self.focusedField = focusedField
    self.isFocusOnAppear = isFocusOnAppear
  }
  
  var body: some View {
    HStack {
      Image(systemName: "magnifyingglass")
        .foregroundStyle(
          searchInput.isEmpty ?
          Color.theme.secondaryColor :
            Color.theme.accent
        )
      TextField(
        "",
        text: $searchInput,
        prompt: Text("Search").foregroundStyle(Color.theme.secondaryColor)
      )
      .focused($focusedField, equals: .searchField)
      .foregroundStyle(Color.theme.primaryColor)
      .overlay(
        Image(systemName: "xmark.circle.fill")
          .padding()
          .offset(x: 10)
          .foregroundStyle(Color.theme.accent)
          .opacity(searchInput.isEmpty ? 0.0 : 1.0)
          .onTapGesture {
            UIApplication.shared.endEditing()
            searchInput = ""
          }
        ,
        alignment: .trailing
      )
    }
    .font(.headline)
    .padding(10)
    .background(
      RoundedRectangle(cornerRadius: 15)
        .fill(Color.theme.backgroundSecondaryColor)
        .shadow(
          color: Color.theme.accent.opacity(0.15),
          radius: 5
        )
    )
    .onAppear{
      if isFocusOnAppear {
        focusedField = .searchField
      }
    }
  }
  
  public func focusOnAppear() -> SearchBarView {
    var new: SearchBarView = self
    new.isFocusOnAppear = true
    return new
  }
}

/*
#Preview {
  ZStack {
    Color.theme.backgroundColor
    SearchBarView(searchInput: .constant(""))
      .focusOnAppear()
  }
}
*/
