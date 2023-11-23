//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Игорь Пивоваров on 23.11.2023.
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    var slipAction: ()->Void
    
    private var speackerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }
    private var isLastSpeacker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    private var speackerText: String {
        guard let speackerNumber = speackerNumber else { return "No more speackers" }
        return "Speacker \(speackerNumber) of \(speakers.count)"
    }
    var body: some View {
        VStack {
            HStack {
                if isLastSpeacker {
                    Text("Last speacker")
                } else{
                    Text(speackerText)
                    Spacer()
                    Button(action: slipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speacker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView(speakers: DailyScrum.sampleDaily[0].attendees.speakers, slipAction: {} )
    }
}
