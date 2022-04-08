//
//  File.swift
//  gentleWeapon
//
//  Created by 何纪栋 on 2022/4/8.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    //MARK: - Properties
//    @State var loopView = [BeatingView(), PlaningView(), PolishingView(), CoolingView(), GrindingView()]
    
    
    //MARK: - Body
    var body: some View {
        TabView {
            ForEach(0 ..< 5) { item in
                CardView()
//                loopView[item]()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
        // 使布局撑满屏幕
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        // 设置背景色
        .background(Color(hex: 0xF1E9DC))
    }
    
    //MARK: - Preview
    struct OnboardingView_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingView()
        }
    }
}

