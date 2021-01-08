//
//  EventModel.swift
//  CombineTest
//
//  Created by Isami Odagiri on 2021/01/02.
//

import Foundation

struct EventGroup: Decodable {
    var events: [EventModel]
}

struct EventModel: Decodable, Identifiable {
    var id: Int
    var title: String
    var subTitle: String
    var eventUrl: String
    var hashTag: String
    var startDate: String
    var ownerDisplayName: String

    enum CodingKeys: String, CodingKey {
        case id = "event_id"
        case title = "title"
        case subTitle = "catch"
        case eventUrl = "event_url"
        case hashTag = "hash_tag"
        case startDate = "started_at"
        case ownerDisplayName = "owner_display_name"
    }
}
