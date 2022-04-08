//
//  File.swift
//  gentleWeapon
//
//  Created by 何纪栋 on 2022/4/8.
//

import Foundation
import SwiftUI

struct CardView: View {
    //MARK: - Properties
    @State private var ironIndex = 0
    
    
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 20){
            Text("\(tips[ironIndex])").font(.largeTitle)
            Image("iron")
                .resizable()
                .frame(width: 300, height: 150, alignment: .center)
        }
    }
    
    //MARK: - Preview
    struct CardView_Previews: PreviewProvider {
        static var previews: some View {
            CardView()
        }
    }
}

