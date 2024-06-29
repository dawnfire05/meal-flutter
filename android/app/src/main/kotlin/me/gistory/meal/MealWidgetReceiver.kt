package me.gistory.meal

import HomeWidgetGlanceWidgetReceiver

class MealWidgetReceiver: HomeWidgetGlanceWidgetReceiver<MealWidgetGlanceAppWidget>() {
    override val glanceAppWidget = MealWidgetGlanceAppWidget()
}