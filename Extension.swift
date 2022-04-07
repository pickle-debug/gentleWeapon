//
//  File.swift
//  gentleWeapon
//
//  Created by 何纪栋 on 2022/4/6.
//

import Foundation
import UIKit
import SwiftUI

extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}
//MARK: - 手势
typealias viewAction = (UIGestureRecognizer)->()

//添加手势枚举
extension UIView {
    enum GestureENUM {
        case tap //点击
        case long //长按
        case pan //拖拽
        case roation //旋转
        case swipe //轻扫
        case pinch //捏合
    }
    
    private struct AssociatedKeys {
        static var actionKey = "gestureKey"
    }
    
    @objc dynamic var action:viewAction? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.actionKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        }
        get {
            if let action = objc_getAssociatedObject(self, &AssociatedKeys.actionKey) as? viewAction {
                return action
            }
            return nil
        }
    }
    
    @objc func viewTapAction(gesture: UIGestureRecognizer) {
        if action != nil {
            action!(gesture)
        }
    }
    /// 添加手势
    func addGesture( _ gesture : GestureENUM , response:@escaping viewAction) {
        
        self.isUserInteractionEnabled = true
        switch gesture {
        case .tap: //点击
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapAction(gesture:)))
            tapGesture.numberOfTouchesRequired = 1
            tapGesture.numberOfTapsRequired = 1
            self.addGestureRecognizer(tapGesture)
            self.action = response
        case .long: //长按
            let longPress = UILongPressGestureRecognizer(target: self, action: #selector(viewTapAction(gesture:)))
            self.addGestureRecognizer(longPress)
            self.action = response
        case .pan: //拖拽
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(viewTapAction(gesture:)))
            self.addGestureRecognizer(panGesture)
            self.action = response
        case .roation: // 旋转
            let roation = UIRotationGestureRecognizer(target: self, action: #selector(viewTapAction(gesture:)))
            self.addGestureRecognizer(roation)
            self.action = response
        case .swipe: //轻扫
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(viewTapAction(gesture:)))
            self.addGestureRecognizer(swipe)
            self.action = response
        case .pinch: //捏合
            let pinch = UIPinchGestureRecognizer(target: self, action: #selector(viewTapAction(gesture:)))
            self.addGestureRecognizer(pinch)
            self.action = response
        }
    }
}
/// 代码延迟运行
///
/// - Parameters:
///   - delayTime: 延时时间。比如：.seconds(5)、.milliseconds(500)
///   - qosClass: 要使用的全局QOS类（默认为 nil，表示主线程）
///   - closure: 延迟运行的代码
public func delay(by delayTime: TimeInterval, qosClass: DispatchQoS.QoSClass? = nil,
                  _ closure: @escaping () -> Void) {
    let dispatchQueue = qosClass != nil ? DispatchQueue.global(qos: qosClass!) : .main
    dispatchQueue.asyncAfter(deadline: DispatchTime.now() + delayTime, execute: closure)
}
