//
//  CardView.swift
//  Scrumdinger
//
//  Created by Игорь Пивоваров on 13.11.2023.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                HStack {
                    Label("\(scrum.attendees.count)", systemImage: "person.3")
                        .accessibilityLabel("\(scrum.attendees.count) attendees")
                    Spacer()
                    Label("\(scrum.lenghtInMinutes)", systemImage: /*@START_MENU_TOKEN@*/"clock"/*@END_MENU_TOKEN@*/)
                        .accessibilityLabel("\(scrum.lenghtInMinutes) minute meeting")
                        .labelStyle(.trailingIcon)
                }
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.sampleDaily[1]
    static var previews: some View {
        CardView(scrum: scrum)
            .background(Color("yellow"))
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
