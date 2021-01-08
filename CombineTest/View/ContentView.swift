//
//  ContentView.swift
//  CombineTest
//
//  Created by Isami Odagiri on 2021/01/02.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.eventDataList) { event in
                RowView(eventData: event)
            }
            .navigationBarTitle(Text("朝活会"))
        }
    }
}
