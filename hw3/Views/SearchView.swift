//
//  SearchView.swift
//  hw3
//
//  Created by Broderick Ryan Schmidt on 9/15/23.
//

import Foundation
import SwiftUI

struct SearchView: View {
    var body: some View {
        Text("Welcome to Search!")
            .font(.largeTitle)
            .padding()
    }
    
    @MainActor
    class UISearchBar : UIView{}
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some
    View {
        SearchView()
    }
}
