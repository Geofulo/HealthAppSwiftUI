//
//  AppEnvironment.swift
//  HealthAppSwiftUI
//
//  Created by Geovanni Fuentes on 2023-12-06.
//

import Foundation

struct AppEnvironment {
    let container: DIContainer
}

extension AppEnvironment {
    static func bootstrap() -> AppEnvironment {
        let appState = Store<AppState>(AppState())
        let session = configuredURLSession()
        let apiRepositories = configuredApiRepositories(session: session)
        let interactors = configuredInteractors(appState: appState, apiRepositories: apiRepositories)
        let diContainer = DIContainer(appState: appState, interactors: interactors)
        return AppEnvironment(container: diContainer)
    }
    
    private static func configuredURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        configuration.urlCache = .shared
        return URLSession(configuration: configuration)
    }
    
    private static func configuredApiRepositories(session: URLSession) -> DIContainer.ApiRepositories {
        let activitiesWebRepository = RealActivitiesApiRepository(
            session: session,
            baseURL: "https://fitness-calculator.p.rapidapi.com")
        return .init(activitiesRepository: activitiesWebRepository)
    }
    
    private static func configuredInteractors(appState: Store<AppState>, apiRepositories: DIContainer.ApiRepositories) -> DIContainer.Interactors {
        let actvitiesInteractor = RealActivitiesInteractor(apiRespository: apiRepositories.activitiesRepository, appState: appState)
        return .init(activitiesInteractor: actvitiesInteractor)
    }
}


