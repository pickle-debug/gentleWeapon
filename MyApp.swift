import SwiftUI

@main
struct MyApp: App {
    enum ToolType {
        case hammer
        case file
        case wheel
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
