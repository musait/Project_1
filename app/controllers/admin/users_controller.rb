class Admin::UsersController < ApplicationController
before_action :admin?
before_action :authenticate_user!
before_action :set_users
before_action :set_id_number

def index
  @users = User.all
  render "admin/dashboards/datatable_user"
end



def edit
  @user = User.find(params[:id])
  render 'admin/dashboards/edit_user'
end

def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_users_path
      flash[:notice] = "Le Profil a été modifié avec succès"
    else
      render 'edit'
    end
end

def destroy
    User.find(params[:id]).destroy
    flash[:success] = "L'utilisateur a été supprimé avec succès"
    redirect_to users_url
end



private

  def set_users
    @users = User.all
  end

  def set_id_number
    @id_numbers = IdentificationNumber.all
    @id_number = IdentificationNumber.new
  end

  def user_params
      params.require(:user).permit(:id_number, :admin,:lastname, :surname, :email, :password,
                                   :password_confirmation, :position)
    end

  def admin?
    if !current_user.admin == true
      redirect_to formations_path
      flash[:notice] = "Vous n'êtes pas admin !"
    end
  end

end
