//
//  ContentView.swift
//  SwipeDirectionExample
//
//  Created by Russell Gordon on 2024-05-30.
//

import SwiftUI

struct Fruit: Identifiable {
    let id = UUID()
    let name: String
}

struct ContentView: View {
    
    // MARK: Stored properties
    @State var currentTab: Int = 1
    @State var fruits: [Fruit] = [
        Fruit(name: "bananas"),
        Fruit(name: "oranges"),
        Fruit(name: "apples"),
        Fruit(name: "pears"),
    ]
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            TabView(selection: $currentTab) {
                
                ForEach(Array(zip(fruits.indices, fruits)), id: \.0) { index, fruit in
                    Text(fruit.name)
                        .tag(index)
                }
                
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            Text("Current tab index: \(currentTab)")
        }
    }
}
#Preview {
    ContentView()
}
