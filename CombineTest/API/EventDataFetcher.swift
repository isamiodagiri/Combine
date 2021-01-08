//
//  EventDataFetcher.swift
//  CombineTest
//
//  Created by Isami Odagiri on 2021/01/02.
//

import Foundation
import Combine

class EventDataFetcher {

    // connpass's event search API
    private let urlLink: String = "https://connpass.com/api/v1/event/?keyword=朝を有効に使い隊"
    private let decorder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .secondsSince1970
        return jsonDecoder
    }()
    
    func fetchEventData()  -> AnyPublisher<EventGroup, Error> {
        let encodeUrl = urlLink.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: encodeUrl!)
        
        return URLSession.shared.dataTaskPublisher(for: URLRequest(url: url!))
            .map { $0.data }                                    //  データだけ
            .decode(type: EventGroup.self, decoder: decorder)   //  EventGroupへデコード
            .eraseToAnyPublisher()                              //  AnyPublisherの形に変えてくれる
    }
}
