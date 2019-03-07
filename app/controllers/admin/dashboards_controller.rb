class Admin::DashboardsController < ApplicationController
before_action :admin?
before_action :authenticate_user!
before_action :set_users
before_action :set_id_number
before_action :set_formations
before_action :set_positions

  def index
    
  end

  def create
  end


private

  def set_users
    @users = User.all
  end

  def set_id_number
    @id_numbers = IdentificationNumber.all
    @id_number = IdentificationNumber.new
  end

  def set_formations
    @formations = Formation.all
    @formation = Formation.new
  end

  def set_positions
    @positions = Position.all
  end

  def admin?
    if !current_user.admin == true
      redirect_to formations_path
      flash[:notice] = "Vous ne pouvez pas acceder à cette page car vous n'êtes pas admin "
    end
  end
end
