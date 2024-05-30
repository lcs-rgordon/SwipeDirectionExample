//
//  TabViewBasedOnStaticViews.swift
//  SwipeDirectionExample
//
//  Created by Russell Gordon on 2024-05-30.
//

import SwiftUI

struct TabViewBasedOnStaticViews: View {
    
    // MARK: Stored properties
    
    // Keep track of what tab we are currently on
    @State var currentTab: Int = 0
    
    // Report on the swipe direction, once a swipe occurs
    @State var swipeDirection: String = ""
    
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            
            // Show a tab view
            //
            // The TabView will updated $currentTab with the tag of whatever page is currently selected
            TabView(selection: $currentTab) {

                Text("bananas")
                    .tag(0)
                
                Text("oranges")
                    .tag(1)
                
                Text("apples")
                    .tag(2)
                
                Text("pears")
                    .tag(3)

            }
            // Present the tab view
            .tabViewStyle(.page)
            // Always show the dots to indicate available pages
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            // What tab are we on?
            Text("Current tab index: \(currentTab)")
            
            // Which direction did we swipe?
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
    TabViewBasedOnStaticViews()
}
