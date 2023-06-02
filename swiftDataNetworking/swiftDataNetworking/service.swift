//
//  serview.swift
//  swiftDataNetworking
//
//  Created by 최동현 on 2023/04/26.
//

import Foundation

struct MovieService {
    static let shared = MovieService()
    
    // MARK: - baseURL + apiKey
    let urlString = "https://openapi.naver.com/v1/search/movie.json?query=lego"
    let clientID = APIConstant.clientID
    let clientSecret = APIConstant.clientSecret
    
    func fetchMovieData(completion: @escaping (Result<Any, Error>) -> ()) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            var requestURL = URLRequest(url: url)
            requestURL.addValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
            requestURL.addValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
            
            let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    do {
                        let decodedData = try JSONDecoder().decode(MovieModel.self, from: safeData)
                        completion(.success(decodedData))
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            dataTask.resume()
        }
    }
}
