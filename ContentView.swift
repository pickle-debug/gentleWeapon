import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @State var hammer = Image("hammer")
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 20){
            // 布局内容
            Text("Drag the hammer to the iron ingot!").font(.largeTitle)
            Image("iron")
                .resizable()
                .frame(width: 300, height: 150, alignment: .center)
            hammer.resizable()
                .frame(width: 100, height: 100)
                .offset(x: currentPosition.width, y: currentPosition.height)
                .onAppear() {
                    currentPosition = .zero
                    newPosition = .zero
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            currentPosition = CGSize(width: value.translation.width + newPosition.width, height: value.translation.height + newPosition.height)
                        }
                        .onEnded { value in
                            currentPosition = CGSize(width: value.translation.width + newPosition.width, height: value.translation.height + newPosition.height)
                            newPosition = currentPosition
                        })
        }
        
        // 使布局撑满屏幕
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        // 设置背景色
        .background(Color(hex: 0xF1E9DC))
    }
    //MARK: - Preview
}

