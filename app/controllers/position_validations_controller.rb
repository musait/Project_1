class PositionValidationsController < ApplicationController

  def index
    @position_validations = PositionValidation.all

  end


  def new
    @position_validation = PositionValidation.new
  end


  def create
    @position_validation = PositionValidation.new(position_validation_params)
    if @position_validation.save
      flash[:notice] = "Votre demande a bien été prise en compte"
      redirect_to edit_user_registration_path
    end
  end


  def edit
  end



  def update
      @position_validation = PositionValidation.find(params[:id])
    if @position_validation.update(position_validation_params)
      next_position = Position.find_by_id(@position_validation.user.positions.uniq.last.id + 1)
      @position_validation.user.positions = [next_position] if next_position.present?
      @position_validation.destroy
      redirect_to admin_upgrade_path
      flash[:notice] = "La position a été mis à jour avec succès"

    else
      redirect_to admin_upgrade_path
      flash[:alert] = "Il y a eu un problème avec la mise à jour de la position"
    end
  end


private

  def position_validation_params
    params.require(:position_validation).permit(:id, :approved, :user_id, :position_id)
  end


end
