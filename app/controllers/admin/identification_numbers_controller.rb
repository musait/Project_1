class Admin::IdentificationNumbersController < ApplicationController
  before_action :admin?
  before_action :authenticate_user!
  before_action :set_id_number, only: [:show, :edit, :update, :destroy]

  # GET /id_numbers
  # GET /id_numbers.json
  def index
    @id_numbers = IdentificationNumber.all
    @id_number = IdentificationNumber.new
    @users = User.all
    render "admin/dashboards/datatable_id"
  end

  # GET /id_numbers/1
  # GET /id_numbers/1.json
  def show
  end

  # GET /id_numbers/new
  def new
    @id_number = IdentificationNumber.new
  end

  # GET /id_numbers/1/edit
  def edit
  end

  # POST /id_numbers
  # POST /id_numbers.json
  def create
    @id_number = IdentificationNumber.new(id_number_params)
      if @id_number.save
        redirect_to admin_id_path
        flash[:notice] = "Le numéro d'identification a été crée avec succès"
      else
        flash[:alert] = "Il y a un problème avec ce numéro d'identification"
      end
  end

  # PATCH/PUT /id_numbers/1
  # PATCH/PUT /id_numbers/1.json
  def update
    respond_to do |format|
      if @id_number.update(id_number_params)
        format.html { redirect_to @id_number, notice: 'Id number was successfully updated.' }
        format.json { render :show, status: :ok, location: @id_number }
      else
        format.html { render :edit }
        format.json { render json: @id_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /id_numbers/1
  # DELETE /id_numbers/1.json
  def destroy
    @id_number.destroy

    flash[:notice] = "Le numéro d'identification a été supprimé avec succès"
    redirect_to admin_id_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_id_number
      @id_number = IdentificationNumber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def id_number_params
      params.require(:identification_number).permit(:id_number)
    end

    def admin?
      if !current_user.admin == true
        flash[:notice] = "Vous n'êtes pas admin !"
        redirect_to formations_path
      end
    end
end
