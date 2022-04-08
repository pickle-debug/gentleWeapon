//
//  File.swift
//  gentleWeapon
//
//  Created by 何纪栋 on 2022/4/8.
//

import Foundation
import SwiftUI
struct ToolView: View {
    //MARK: - Properties
    enum ToolType {
        case hammer
        case file
        case wheel
    }
    @State public var tool = Image("\(ToolType.self)")
    
    
    //MARK: - Body
    var body: some View {
        tool.resizable()
    }
}

//MARK: - Preview
struct ToolView_Previews: PreviewProvider {
    static var previews: some View {
        ToolView()
    }
}


