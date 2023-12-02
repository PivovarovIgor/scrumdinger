//
//  History.swift
//  Scrumdinger
//
//  Created by Игорь Пивоваров on 25.11.2023.
//

import Foundation


struct History : Identifiable, Codable {
    let id: UUID
    let date: Date
    var attendees: [DailyScrum.Attendee]
    var transcription: String?
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee], transcription: String? = nil) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.transcription = transcription
    }
}
