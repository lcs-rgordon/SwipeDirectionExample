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
    
    // Keep track of what tab we are currently on
    @State var currentTab: Int = 0
    
    // Report on the swipe direction, once a swipe occurs
    @State var swipeDirection: String = ""
    
    // A simple list of data (this could come from different sources in other apps)
    @State var fruits: [Fruit] = [
        Fruit(name: "bananas"),
        Fruit(name: "oranges"),
        Fruit(name: "apples"),
        Fruit(name: "pears"),
    ]
    
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            
            // Show a tab view
            //
            // The TabView will updated $currentTab with the tag of whatever page is currently selected
            TabView(selection: $currentTab) {
                
                // Iterate over the array of fruits
                //
                // index: holds the position of the current item in the array
                // fruit: holds the current item in the array
                ForEach(Array(zip(fruits.indices, fruits)), id: \.0) { index, fruit in
                    
                    // Display the fruit
                    Text(fruit.name)
                        .tag(index) // tag this view with an integer
                }
                
            }
            // Present the tab view
            .tabViewStyle(.page)
            // Always show the dots to indicate available pages
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            Text("Current tab index: \(currentTab)")
            Text(swipeDirection)
        }
        // This is triggered whenever the current tab changes
        .onChange(of: currentTab) { oldValue, newValue in
            
            // Figure out what direction the swipe was
            if oldValue > newValue {
                swipeDirection = "User swiped right."
            } else {
                swipeDirection = "User swiped left."
            }
            
        }
    }
}
#Preview {
    ContentView()
}
