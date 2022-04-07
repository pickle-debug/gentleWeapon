//import SwiftUI
//import Foundation
//enum ToolType {
//    case hammer
//    case file
//    case wheel
//}
//class Tool:View{
//    var body:View {
//        Image("\(ToolType)")
//    }
//}
//

import SwiftUI

struct ContentView: View {
  @State private var currentPosition: CGSize = .zero
  @State private var newPosition: CGSize = .zero
  @State private var screenBounds: CGRect = .zero
  @State private var boundsPosition: CGSize = .zero
  @State private var orientation = UIDevice.current.orientation
  let widthLimit: CGFloat = 100
  let heightLimit: CGFloat = 100
  let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
    .makeConnectable()
    .autoconnect()
  
  var body: some View {
    Rectangle()
      .frame(width: 100, height: 100)
      .foregroundColor(.green)
      .offset(x: currentPosition.width, y: currentPosition.height)
      .onAppear() {
       currentPosition = .zero
       newPosition = .zero
        setTravelLimits()
        limitTravel()
      }
      .onReceive(orientationChanged) {_ in
        setTravelLimits()
        limitTravel()
      }
      .gesture(
        DragGesture()
          .onChanged { value in
            currentPosition = CGSize(width: value.translation.width + newPosition.width, height: value.translation.height + newPosition.height)
            limitTravel()
          }
          .onEnded { value in
            currentPosition = CGSize(width: value.translation.width + newPosition.width, height: value.translation.height + newPosition.height)
            limitTravel()
            newPosition = currentPosition
          })
  }
  
  func setTravelLimits() {
    screenBounds = UIScreen.main.bounds
    boundsPosition.width = (screenBounds.width / 2) - widthLimit
    boundsPosition.height = (screenBounds.height / 2) - heightLimit
  }
  
  func limitTravel() {
    currentPosition.height = currentPosition.height > boundsPosition.height ? boundsPosition.height: currentPosition.height
   currentPosition.height = currentPosition.height < -boundsPosition.height ? -boundsPosition.height: currentPosition.height
    currentPosition.width = currentPosition.width > boundsPosition.width ? boundsPosition.width: currentPosition.width
    currentPosition.width = currentPosition.width < -boundsPosition.width ? -boundsPosition.width: currentPosition.width
  }
}
