//
//  ActivitiesWebRepository.swift
//  HealthAppSwiftUI
//
//  Created by Geovanni Fuentes on 2023-12-05.
//

import Foundation
import Combine

protocol ActivitiesApiRepository: ApiRepository {
    func loadActivities() -> AnyPublisher<ActivitiesResponseEntryModel, Error>
}

struct RealActivitiesApiRepository: ActivitiesApiRepository {
    let session: URLSession
    let baseURL: String
    
    init(session: URLSession, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }
    
    func loadActivities() -> AnyPublisher<ActivitiesResponseEntryModel, Error> {
        return call(endpoint: API.activities)
    }
}

extension RealActivitiesApiRepository {
    enum API {
        case activities
    }
}

extension RealActivitiesApiRepository.API: APICall {
    var path: String {
        switch self {
        case .activities:
            return "/activities?intensitylevel=9"
        }
    }
    
    var method: String {
        switch self {
        case .activities:
            return "GET"
        }
    }
    
    var headers: [String : String]? {
        [
            "Accept": "application/json",
            "X-RapidAPI-Key": "39ff363470msh7bf1df1809a5124p1be641jsnfe115a51bf24",
            "X-RapidAPI-Host": "fitness-calculator.p.rapidapi.com"
        ]
    }
    
    func body() throws -> Data? {
        return nil
    }
}
