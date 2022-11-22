//
//  ApiProvider.swift
//  MyTeam
//
//  Created by User on 21.11.2022.
//

import Foundation

class APIProvider {

    private let baseUrl: URL

     init(baseUrl: URL = URL(string: "https://stoplight.io/mocks/")!) {
         self.baseUrl = baseUrl
     }

     @discardableResult func getData<Response: Codable>(
         _ model: Response.Type = Response.self,
         from endpoint: String,
         _ completion: @escaping (Result<Response, Error>) -> Void
     ) -> URLSessionDataTask {
         let url = baseUrl.appendingPathComponent(endpoint)
         let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
             guard let data = data, error == nil else {
                 print("Data getting error")
                 DispatchQueue.main.async {
                     if let error = error {
                     completion(.failure(error))
                     } else {
                         print("Unknown error")
                     }
                 }
              return
             }
             do {
                 let decoder = JSONDecoder()
                 let dateFormatter = DateFormatter()
                 dateFormatter.dateFormat = "yyyy-MM-dd"
                 decoder.dateDecodingStrategy = .formatted(dateFormatter)
                 let result = try decoder.decode(Response.self, from: data)
                 DispatchQueue.main.async {
                     completion(.success(result))
                 }
             } catch {
                 DispatchQueue.main.async {
                     print("Cannot convert JSON: \(error)")
                     completion(.failure(error))
                 }
             }
         }
         dataTask.resume()
         return dataTask
     }
 }
