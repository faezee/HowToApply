class AppInfosController < ApplicationController
  before_action :set_app_info, only: [:show, :edit, :update, :destroy]

  # GET /app_infos
  # GET /app_infos.json
  def index
    @app_infos = AppInfo.all
  end

  # GET /app_infos/1
  # GET /app_infos/1.json
  def show
  end

  # GET /app_infos/new
  def new
    @app_info = AppInfo.new
  end

  # GET /app_infos/1/edit
  def edit
  end

  # POST /app_infos
  # POST /app_infos.json
  def create
    @app_info = AppInfo.new

    @plan = Plan.where("degree_id=? and uni_id=? and field_id=?", params[:app_info][:degree_id], params[:app_info][:uni_id], params[:app_info][:field_id]).first


    @app_info.plan_id=@plan.id
    @app_info.profile_id=current_user.profile.id
    #@app_info.professer_id=Professer.find_by_name(params[:prof_name]).id
    @app_info.professer_id=Professer.where("id=?", params[:app_info][:professer_id]).first.id
    # @app_info.professer_id=Professer.find(params[:app_info][:professer_id).id

      @app_info.save
        
      redirect_to :back
      
        
  end

  # PATCH/PUT /app_infos/1
  # PATCH/PUT /app_infos/1.json
  def update
    respond_to do |format|
      if @app_info.update(app_info_params)
        format.html { redirect_to @app_info, notice: 'App info was successfully updated.' }
        format.json { render :show, status: :ok, location: @app_info }
      else
        format.html { render :edit }
        format.json { render json: @app_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_infos/1
  # DELETE /app_infos/1.json
  def destroy
    @app_info.destroy
    respond_to do |format|
      format.html { redirect_to app_infos_url, notice: 'App info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_info
      @app_info = AppInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_info_params
      params.require(:app_info).permit(:plan_id, :profile_id, :acc_or_rej)
    end
end
