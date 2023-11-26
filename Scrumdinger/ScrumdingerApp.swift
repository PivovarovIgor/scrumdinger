//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Игорь Пивоваров on 12.11.2023.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            ScrumView(scrums: $store.scrums) {
                Task {
                    do {
                        try await store.save(scrums: store.scrums)
                    } catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Try again laiter.")
                    }
                }
            }
                .task {
                    do {
                        try await store.load()
                    } catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.")
                    }
                }
                .sheet(item: $errorWrapper) {
                    store.scrums = DailyScrum.sampleDaily
                } content: { wrapper in
                    ErrorView(errorWrapper: wrapper)
                }
        }
    }
}
