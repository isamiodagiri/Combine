//
//  RowView.swift
//  CombineTest
//
//  Created by Isami Odagiri on 2021/01/02.
//

import SwiftUI

struct RowView: View {
    
    var eventData: EventModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(eventData.title)
                .bold()
                .font(.headline)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.vertical, 8.0)
            HStack {
                Image(systemName: "calendar")
                    .imageScale(.medium)
                    .foregroundColor(.red)
                Text(eventData.startDate).font(.footnote)
            }
            HStack {
                Image(systemName: "person.fill")
                    .imageScale(.medium)
                    .foregroundColor(.red)
                Text(eventData.ownerDisplayName + " 他").font(.footnote)
            }.padding(.vertical, 6.0)

            HStack {
                Spacer()
                Text("#" + eventData.hashTag)
                    .foregroundColor(.blue)
                    .font(.caption)
            }
            .padding(.bottom, 8.0)
        }
    }
}
