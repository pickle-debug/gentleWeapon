//
//  File.swift
//  gentleWeapon
//
//  Created by 何纪栋 on 2022/4/8.
//

import Foundation
import SwiftUI

struct CoolingView: View {
    //MARK: - Properties
    
    
    //MARK: - Body
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
    }
    
    //MARK: - Preview
    struct CoolingView_Previews: PreviewProvider {
        static var previews: some View {
            CoolingView()
        }
    }
}

