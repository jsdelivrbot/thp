class EventsController < ApplicationController
  def new
    @event=current_user.authored_events.new
  end

  def create
    @user=current_user
    @event=@user.authored_events.new(event_params)
    if @event.save
      flash[:success] = "You successfully created the event!"
      redirect_to current_user
      @event.user_attendees << current_user
      @event.save
    else
      render 'new'
      flash.now[:error] = "Event could not be created"
    end
  end

  def event_params
     params.require(:event).permit(:name, :description, :date, :place)
  end

  def show
    @event = Event.find(params[:id])
    @users =User.all
  end

  def index
    @events = Event.all
  end

  def attend
    @event = Event.find(params[:id])
    @event.user_attendees << current_user
    @event.save
    flash[:success] = "You succesfully registered for the event"
    redirect_to events_path
  end

  def invite
    @event = Event.find(params[:id])
    @user = User.find(params[:user])
    @event.user_attendees << @user
    @event.save
    flash[:success] = "You succesfully added your friend to the event"
    redirect_to @event
  end

  def unattend
    @event = Event.find(params[:id])
    @event.user_attendees.delete(current_user)
    @event.save
    flash[:success] = "You succesfully unattended the event"
    redirect_to current_user
  end

end
