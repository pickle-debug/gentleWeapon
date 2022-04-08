//
//  File.swift
//  gentleWeapon
//
//  Created by 何纪栋 on 2022/4/7.
//

import Foundation
import SwiftUI
//MARK: - 全局常量属性
let tips:[String] = ["Drag the hammer to the iron ingot!",
                     "Now! Tap iron, make it flat!",
                     "Again,need 3",
                     "need 2",
                     "need 1",
                     "file!"]
enum process{
    case Beating
    case Planing
    case Polishing
    case Cooling
    case Grinding
}
