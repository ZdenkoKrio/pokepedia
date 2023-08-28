//
//  FavoritPokemon.swift
//  FavoritPokemon
//
//  Created by Zdenko Čepan on 27.08.2023.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), name: "bulb", configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), name: "Cahr", configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        
        let date = Date()
        let nextUpdateDate = Calendar.current.date(byAdding: .second, value: 5, to: date)!
        /*let entry = SimpleEntry(date: date, name: ["p", "a", "b"].randomElement()!, configuration: configuration)
            entries.append(entry)
        */
        
        entries.append(SimpleEntry(date: date, name: "HAHA", configuration: configuration))
        

        let timeline = Timeline(entries: entries, policy: .after(nextUpdateDate))
        completion(timeline)
    }
    
   
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    var name: String
    let numbers: [Int] = [1, 2, 3]
    let configuration: ConfigurationIntent
}

struct FavoritPokemonEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        HStack(alignment: .center) {
            ForEach(entry.numbers, id: \.self) { item in
                Image("Pokemon\(item)")
            }
        }
 //       .containerBack
    }
}

struct FavoritPokemon: Widget {
    let kind: String = "FavoritPokemon"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            FavoritPokemonEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemLarge])
    }
}

 struct FavoritPokemon_Previews: PreviewProvider {
 static var previews: some View {
 FavoritPokemonEntryView(entry: SimpleEntry(date: Date(), name: "pogo", configuration: ConfigurationIntent()))
 .previewContext(WidgetPreviewContext(family: .systemSmall))
 }
 }
