//
//  VideoPlayer.swift
//  MoviesApp
//
//  Created by Ezequiel Nicolas Velez on 21/09/2024.
//

import SwiftUI
import WebKit

struct VideoView: UIViewRepresentable {
  let videoId: String
  
  func makeUIView(context: Context) -> WKWebView {
    let configuration = WKWebViewConfiguration()
    configuration.allowsInlineMediaPlayback = true
    return WKWebView(frame: .zero, configuration: configuration)
  }
  
  func updateUIView(_ uiView: WKWebView, context: Context) {
    guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else {
      return
    }
    uiView.scrollView.isScrollEnabled = false
    uiView.load(URLRequest(url: youtubeURL))
  }
}
