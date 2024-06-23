//
//  RiceWidgetLiveActivity.swift
//  RiceWidget
//
//  Created by 보성 on 6/23/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct RiceWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct RiceWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: RiceWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension RiceWidgetAttributes {
    fileprivate static var preview: RiceWidgetAttributes {
        RiceWidgetAttributes(name: "World")
    }
}

extension RiceWidgetAttributes.ContentState {
    fileprivate static var smiley: RiceWidgetAttributes.ContentState {
        RiceWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: RiceWidgetAttributes.ContentState {
         RiceWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: RiceWidgetAttributes.preview) {
   RiceWidgetLiveActivity()
} contentStates: {
    RiceWidgetAttributes.ContentState.smiley
    RiceWidgetAttributes.ContentState.starEyes
}
