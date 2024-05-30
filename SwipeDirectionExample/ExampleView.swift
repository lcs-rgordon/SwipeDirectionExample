//
//  ExampleView.swift
//  SwipeDirectionExample
//
//  Created by Russell Gordon on 2024-05-30.
//

import SwiftUI

struct ExampleView: View {
    let fruits = ["Apple", "Banana", "Cherry", "Date", "Elderberry"]

    var body: some View {
        VStack {
            ForEach(Array(fruits.enumerated()), id: \.offset) { index, fruit in
                VStack(alignment: .leading) {
                    Text("Fruit: \(fruit)")
                    Text("Index: \(index)")
                }
                .padding()
            }
        }
    }
}

#Preview {
    ExampleView()
}
