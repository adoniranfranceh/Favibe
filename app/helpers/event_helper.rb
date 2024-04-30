module EventHelper
  def formatted_no_events_message(filtered_events)
    events_type = filtered_events.present? ? t(filtered_events).downcase : Event.model_name.human(count: 2).downcase
    t(:no_events, events: events_type)
  end  
end
