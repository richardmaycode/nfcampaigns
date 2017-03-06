class Admin::AttendeesController < ApplicationController
  layout 'admin'
  before_action :set_event 
  before_action :require_user, :require_admin
  
  def index
    @attendees = Attendee.includes(:pledge_page).where(event_id: @event.id)
  end
  
  private 
    def set_event 
      @event = Event.find_by_title(params[:event_id])
    end
    
    def attendee_params
  
    end
end