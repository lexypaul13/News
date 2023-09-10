//
//  NetworkManager.swift
//  News
//
//  Created by Alex Paul on 9/1/23.
//

import Foundation

enum EndPoints {
    case newList
    var url: String {
        switch self {
        case .newList:
            return "https://newsapi.org/v2/everything?q=apple&from=2023-09-03&to=2023-09-03&sortBy=popularity&apiKey=832a7dc044814754adc70dde879593e4"
        }
    }
}

enum NetworkError: String, Error {
    case invalidURL = "Invalid URL."
    case noData = "No data received from server."
}

protocol Networking {
    func fetch<T: Decodable>(endpoint: EndPoints, completion: @escaping (Result<T, NetworkError>) -> Void)
}

class NetworkManager: Networking {
    let jsonDecoder: JSONDecoder
    
    init() {
        self.jsonDecoder = JSONDecoder()
        self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func fetch<T: Decodable>(endpoint: EndPoints, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: endpoint.url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, error, _ in
            guard let self = self, let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decodedData = try self.jsonDecoder.decode(T.self, from: data)
               
                    completion(.success(decodedData))
                    print(decodedData)
                
            } catch {
                print(error)
                    completion(.failure(.noData))
                
            }
        }.resume()
    }
}

/*
 enum NetworkError: String, Error {
     case invalidURL = "Invalid URL."
     case noData = "No data received from server."
 }

 enum EndPoints {
     case newList
     var url: String {
         switch self {
         case .newList:
             return "https://newsapi.org/v2/everything?q=apple&from=2023-09-03&to=2023-09-03&sortBy=popularity&apiKey=832a7dc044814754adc70dde879593e4"
         }
     }
 }

 class NetworkManager {
     let jsonDecoder: JSONDecoder
     
     init() {
         self.jsonDecoder = JSONDecoder()
         self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
     }
     
     func fetch<T: Decodable>(endpoint: EndPoints) -> Effect<Result<T, NetworkError>, Never> {
         return Effect<Result<T, NetworkError>, Never>.future { promise in
             self.fetch(endpoint: endpoint) { (result: Result<T, NetworkError>) in
                 promise(result)
             }
         }
     }
     
     private func fetch<T: Decodable>(endpoint: EndPoints, completion: @escaping (Result<T, NetworkError>) -> Void) {
         guard let url = URL(string: endpoint.url) else {
             completion(.failure(.invalidURL))
             return
         }
         
         URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
             guard let self = self, let data = data else {
                 completion(.failure(.noData))
                 return
             }
             
             do {
                 let decodedData = try self.jsonDecoder.decode(T.self, from: data)
                 completion(.success(decodedData))
             } catch {
                 completion(.failure(.noData))
             }
         }.resume()
     }
 }
 
 */
