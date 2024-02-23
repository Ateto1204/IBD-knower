/**
 *
 * @author Ateto
 */

import SwiftUI
import TipKit

@main
struct MyApp: App {
    @StateObject var selectStatus = SelectStatus()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(selectStatus)
        }
    }
    
    init() {
        try? Tips.configure([
            .displayFrequency(.immediate), 
            .datastoreLocation(.applicationDefault)
        ])
    }
}
