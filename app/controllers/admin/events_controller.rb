class Admin::EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :end_date, only: [:create,:update]

  def index
    @events = Event.all
    @address = Address.all
    respond_to do |format|
      format.html { render 'admin/dashboards/calendar' }
      format.json { render json: @events.as_json(include: [:address, :user]) }
    end
  end

  def show
  end

  def new
    @event = Event.new
    respond_to do |format|
      format.js {
          render :template =>  "admin/dashboards/events/new.js.erb"
      }
    end
  end

  def edit
    @event = Event.find(params[:id])
    @address = @event.address
    respond_to do |format|
      format.js { render :template =>  "admin/dashboards/events/edit"}
    end
  end

  def create
    @address = Address.find_or_create_by(address_params)
    @user = User.find_or_create_by(user_params)
    @event = Event.new(event_params.merge(address_id: @address.id, user_id: @user.id))
      if @event.save
        redirect_to admin_calendar_path
        flash[:notice] = "L'évenement a été crée avec succès"
      else
        redirect_to admin_calendar_path
        if @event.title == ""
          flash[:alert] = "Il y a un problème avec cet évenement : il manque un titre."
        elsif @event.description == ""
          flash[:alert] = "Il y a un problème avec cet évenement : il manque une description."
        else
          flash[:alert] = "Il y a un problème avec cet évenement."
        end
      end
  end

  def update
      if @event.address.update(address_params) && @event.update(event_params)
        redirect_to admin_calendar_path
        flash[:notice] = "L'évenement a été mis à jour avec succès"
      else
        flash[:alert] = "Il y a un problème avec cet évenement"
      end
  end

  def destroy
    if @event.destroy
      redirect_to admin_calendar_path
      flash[:notice] = "L'évenement a été supprimé avec succès"
    else
      flash[:alert] = "Il y a un problème avec cet évenement"
    end

  end

  private


    def end_date
      if params[:event][:start] > params[:event][:end]
        redirect_to admin_calendar_path
        flash[:alert] = "La date de début de l'évenement ne peut être postérieur à la date de fin"
      end
    end



    def set_event
      if params[:event].nil?
        @event = Event.find(params[:id])
      elsif params[:event][:id].nil?
        @event = Event.find(params[:id])
      else
        @event = Event.find(params[:event][:id])
      end
    end

    def event_params
      params.require(:event).permit(:id, :title, :description, :date_range, :start, :end,:address_id, :user_id, address:{})
    end

    def address_params
      params.fetch(:address, {}).permit(:id, :number, :voie_type, :street, :postal_code, :city)
    end

    def user_params
      params.fetch(:user, {}).permit(:id, :surname, :lastname)
    end

end
