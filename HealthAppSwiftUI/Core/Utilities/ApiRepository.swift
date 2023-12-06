//
//  ApiRepository.swift
//  HealthAppSwiftUI
//
//  Created by Geovanni Fuentes on 2023-12-05.
//

import Foundation
import Combine

protocol ApiRepository {
    var session: URLSession { get }
    var baseURL: String { get }
}

extension ApiRepository {
    func call<Value>(endpoint: APICall) -> AnyPublisher<Value, Error> where Value: Decodable {
        do {
            let request = try endpoint.urlRequest(baseURL: baseURL)
            return session
                .dataTaskPublisher(for: request)
                .map { data, _ in data }
                .decode(type: Value.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        } catch let error {
            return Fail<Value, Error>(error: error).eraseToAnyPublisher()
        }
    }
}
