//import SwiftUI
//
//struct ContentView: View {
//    //MARK: - Properties
//    @State var hammer = Image("hammer")
////    var drag: some Gesture {
////        DragGesture().onChanged { _ in
////            self.isDragging = true
////        }.onEnded { _ in
////            self.isDragging = false
////        }
////    }
//    
//    //MARK: - Body
//    var body: some View {
//        VStack(spacing: 20){
//            // 布局内容
//            hammer.resizable().frame(width: 100, height: 100, alignment: .center).gesture(drag)
//            Text("Drag the hammer to the iron ingot!").font(.largeTitle)
//            Image("iron")
//                .resizable()
//                .frame(width: 300, height: 150, alignment: .center)
//        }
//        
//        // 使布局撑满屏幕
//        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//        // 设置背景色
//        .background(Color(hex: 0xF1E9DC))
//    }
//    //MARK: - Preview
//}
//
