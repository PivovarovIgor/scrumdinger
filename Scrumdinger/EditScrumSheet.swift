//
//  EditScrumSheet.swift
//  Scrumdinger
//
//  Created by Игорь Пивоваров on 24.11.2023.
//

import SwiftUI

struct EditScrumSheet: View {
    @State private var editingScrum: DailyScrum = DailyScrum.emptyScrum
    @Binding var isPresentingEditScrumView: Bool
    @Binding var scrum: DailyScrum
   
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $editingScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dissmiss") {
                            isPresentingEditScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            scrum = editingScrum
                            isPresentingEditScrumView = false
                        }
                    }
                }
                .onAppear {
                    editingScrum = scrum
                }
        }
    }
}

struct EditScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        EditScrumSheet(isPresentingEditScrumView: .constant(true), scrum: .constant(DailyScrum.sampleDaily[0]))
    }
}
