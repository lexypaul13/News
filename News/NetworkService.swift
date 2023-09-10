//
//  NetworkService.swift
//  News
//
//  Created by Alex Paul on 9/1/23.
//

import Foundation

class NetworkService {
    private let network: Networking
    
    init(networkManager: Networking = NetworkManager()) {
        self.network = networkManager
    }
    
    func fetchMealList(completion: @escaping (Result<News, NetworkError>) -> Void) {
        network.fetch(endpoint: .newList, completion: completion)
    }
    
    
}
