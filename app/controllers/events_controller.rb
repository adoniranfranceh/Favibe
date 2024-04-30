class EventsController < ApplicationController
  def index 
    @filtered_events = params[:filter]
    return @events = Event.published if @filtered_events == 'events_published'
    return @events = Event.hidden if @filtered_events == 'events_hidden'

    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end
end
