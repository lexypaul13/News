//
//  NewViewModel.swift
//  News
//
//  Created by Alex Paul on 9/1/23.
//

import Foundation

class NewsListViewModel: ObservableObject {
    @Published var news: [Articles] = []
    private var networkService: NetworkService
    
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchNews() {
        networkService.fetchMealList { [weak self] result in
            switch result {
            case .success(let news):
                DispatchQueue.main.async {
                    self?.news = news.articles
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
