/**
 *
 * @author Ateto
 */

import SwiftUI

@main
struct MyApp: App {
    @StateObject var selectStatus = SelectStatus()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(selectStatus)
        }
    }
}
