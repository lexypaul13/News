//
//  ContentView.swift
//  News
//
//  Created by Alex Paul on 9/1/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var newsListVM = NewsListViewModel()
       
    init() {
        newsListVM.fetchNews()
    }
       
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<newsListVM.news.count, id: \.self) { index in
                    ListCell(title: newsListVM.news[index].title ?? "Not Title", caption: newsListVM.news[index].description ?? "None exist")
                }
            }
            .navigationBarTitle("News List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
