class Admin::FormationsController < ApplicationController
    before_action :admin?
    before_action :authenticate_user!
    before_action :set_formation, only: [:show, :edit, :update, :destroy]

    # GET /formations
    # GET /formations.json
    def index
      @formations = Formation.all
      @formation = Formation.new
      @users = User.all
      render "admin/dashboards/datatable_formation"
    end

    # GET /formations/1
    # GET /formations/1.json
    def show
    end

    # GET /formations/new
    def new
      @formation = Formation.new
    end

    # GET /formations/1/edit
    def edit
      @formation = Formation.find(params[:id])
      render "/admin/dashboards/edit_formation"
    end

    # POST /formations
    # POST /formations.json
    def create
      @formation = Formation.new(formation_params)
        if @formation.save
          redirect_to admin_formations_path
          flash[:notice] = "La formation a été crée avec succès"
        else
          flash[:alert] = "Il y a un problème avec cette formation"
        end
    end

    # PATCH/PUT /formations/1
    # PATCH/PUT /formations/1.json
    def update
        if @formation.update(formation_params)
         redirect_to admin_formations_path 
         flash[:notice] = "La formation a été mise à jour avec succès"
        else
         flash[:alert] = "Il y a un problème avec cette formation"
        end
    end

    # DELETE /formations/1
    # DELETE /formations/1.json
    def destroy
      binding.pry
      @formation.destroy


      flash[:notice] = "La formation a été supprimée avec succès"
      redirect_to admin_formations_path
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_formation
        @formation = Formation.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def formation_params
        params.require(:formation).permit(:title, :description, :link, :name, { position_ids: []}, :position_number, :id)
      end

      def admin?
        if current_user.admin == true
        else
          redirect_to formations_path
          flash[:notice] = "Vous n'êtes pas admin !"
        end
      end


end
