//
//  ListViewModel.swift
//  CombineTest
//
//  Created by Isami Odagiri on 2021/01/02.
//

import Foundation
import Combine

class ListViewModel: ObservableObject {
    private let fetcher = EventDataFetcher()
    private var disposables = Set<AnyCancellable>()     //  RxSwiftで言うなら「Disposebag」

    @Published var eventDataList: [EventModel] = []

    init() {
        fetcher.fetchEventData()
            .receive(on: DispatchQueue.main)            //  RxSwiftで言うなら「.observeOn()」
            .sink { [weak self] value in                //  RxSwiftで言うなら「.subscribe()」
                switch value {
                case .failure:
                    self?.eventDataList = []
                case .finished:
                    break
                }
            } receiveValue: { [weak self] respone in
                self?.eventDataList = respone.events
            }
            .store(in: &disposables)                    //  RxSwiftで言うなら「.disposed(by: )」
    }
}
