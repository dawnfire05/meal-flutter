import ActivityKit
import WidgetKit
import SwiftUI

struct MealWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct MealWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MealWidgetAttributes.self) { context in
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

extension MealWidgetAttributes {
    fileprivate static var preview: MealWidgetAttributes {
        MealWidgetAttributes(name: "World")
    }
}

extension MealWidgetAttributes.ContentState {
    fileprivate static var smiley: MealWidgetAttributes.ContentState {
        MealWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: MealWidgetAttributes.ContentState {
         MealWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: MealWidgetAttributes.preview) {
   MealWidgetLiveActivity()
} contentStates: {
    MealWidgetAttributes.ContentState.smiley
    MealWidgetAttributes.ContentState.starEyes
}
