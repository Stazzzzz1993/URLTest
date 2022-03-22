//
//  APICaller.swift
//  CryptoTracker
//
//  Created by Admin on 3/21/22.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
     
    private struct Constants {
        static let apiKey = "DD871549-5A96-4C23-87AE-7A473BC66F63"
        static let assetsEndpoint = "http://rest-sandbox.coinapi.io/v1/assets/"
    }
    
    private init() {}
        
        public func getAllCryptodata (completion: @escaping ( Result <[Crypto], Error> ) -> Void) {
            guard let url = URL(string: Constants.assetsEndpoint + "?apiKey=" + Constants.apiKey) else {
                return
            }
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
    
                    completion(.success(cryptos.sorted { first, second -> Bool in
                        return first.price_usd ?? 0 > second.price_usd ?? 0
                    }))
                }
                catch {
                    completion(.failure(error))
                }
            }
            task.resume()
            
    }
}

