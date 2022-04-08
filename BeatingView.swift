import SwiftUI

struct BeatingView: View {
    //MARK: - Properties
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 20){
            // 布局内容
            CardView()
            ToolView(tool: Image("hammer"))
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
        }// 使布局撑满屏幕
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        // 设置背景色
        .background(Color(hex: 0xF1E9DC))
    }
    //MARK: - Preview
}

