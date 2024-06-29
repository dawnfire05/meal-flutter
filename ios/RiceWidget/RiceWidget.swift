//
//  RiceWidget.swift
//  RiceWidget
//
//  Created by 보성 on 6/23/24.
//

import WidgetKit
import SwiftUI

private let widgetGroupId = "group.me.gistory.rice"

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct RiceWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Text("밥").font(.system(size: 96, weight: .bold)).opacity(0.1)
            VStack(alignment: .leading) {
                HStack {
                    Text("1학 아침").font(.system(size: 16, weight: .bold)).foregroundStyle(Color("primary"))
                    Spacer()
                    Text("Mon, June 24").font(.system(size: 8))
                }.padding(.bottom, 1)
                Text("흑미밥 | 미역국 | 계란후라이 | 치킨너겟 & 머스타드 | 검정콩자반 | 배추김치 | 야채샐러드 | 시리얼 & 우유 | 토스트&잼").font(.system(size: 12))
                Spacer()
            }
        }
    }
}

struct RiceWidget: Widget {
    let kind: String = "RiceWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            RiceWidgetEntryView(entry: entry)
                .containerBackground(.white, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    RiceWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}

#Preview(as: .systemMedium) {
    RiceWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}
