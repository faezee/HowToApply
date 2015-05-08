class ApplyInfosController < ApplicationController
  before_action :set_apply_info, only: [:show, :edit, :update, :destroy]

  # GET /apply_infos
  # GET /apply_infos.json
  def index
    @apply_infos = ApplyInfo.all
  end

  # GET /apply_infos/1
  # GET /apply_infos/1.json
  def show
  end

  # GET /apply_infos/new
  def new
    @apply_info = ApplyInfo.new
  end

  # GET /apply_infos/1/edit
  def edit
  end

  # POST /apply_infos
  # POST /apply_infos.json
  def create
    @apply_info = ApplyInfo.new(apply_info_params)
    @apply_info.profile = current_user.profile
    respond_to do |format|
      if @apply_info.save
        format.html { redirect_to @apply_info, notice: 'Apply info was successfully created.' }
        format.json { render :show, status: :created, location: @apply_info }
      else
        format.html { render :new }
        format.json { render json: @apply_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apply_infos/1
  # PATCH/PUT /apply_infos/1.json
  def update
    respond_to do |format|
      if @apply_info.update(apply_info_params)
        format.html { redirect_to @apply_info, notice: 'Apply info was successfully updated.' }
        format.json { render :show, status: :ok, location: @apply_info }
      else
        format.html { render :edit }
        format.json { render json: @apply_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apply_infos/1
  # DELETE /apply_infos/1.json
  def destroy
    @apply_info.destroy
    respond_to do |format|
      format.html { redirect_to apply_infos_url, notice: 'Apply info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apply_info
      @apply_info = ApplyInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apply_info_params
      params.require(:apply_info).permit(:uni, :teacher, :field, :degree, :app_fee, :min_toefl, :min_GRE, :city, :country, :deadline, :acc_ot_rej)
    end
end
