//
//  DisposableBag.swift
//  HealthAppSwiftUI
//
//  Created by Geovanni Fuentes on 2023-12-06.
//

import Foundation
import Combine

final class DisposableBag {
    fileprivate(set) var subscriptions = Set<AnyCancellable>()
    private let equalToAny: Bool
    
    init(equalToAny: Bool = false) {
        self.equalToAny = equalToAny
    }
    
    func cancel() {
        subscriptions.removeAll()
    }
    
    func isEqual(to other: DisposableBag) -> Bool {
        return other === self || other.equalToAny || self.equalToAny
    }
}

extension AnyCancellable {
    
    func store(in cancelBag: DisposableBag) {
        cancelBag.subscriptions.insert(self)
    }
}
