class ProfessersController < ApplicationController
  before_action :set_professer, only: [:show, :edit, :update, :destroy]

  # GET /professers
  # GET /professers.json
  def index
    @professers = Professer.all
  end

  # GET /professers/1
  # GET /professers/1.json
  def show
  end

  # GET /professers/new
  def new
    @professer = Professer.new
  end

  # GET /professers/1/edit
  def edit
  end

  # POST /professers
  # POST /professers.json
  def create
    @professer = Professer.new(professer_params)

    respond_to do |format|
      if @professer.save
        format.html { redirect_to @professer, notice: 'Professer was successfully created.' }
        format.json { render :show, status: :created, location: @professer }
      else
        format.html { render :new }
        format.json { render json: @professer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professers/1
  # PATCH/PUT /professers/1.json
  def update
    respond_to do |format|
      if @professer.update(professer_params)
        format.html { redirect_to @professer, notice: 'Professer was successfully updated.' }
        format.json { render :show, status: :ok, location: @professer }
      else
        format.html { render :edit }
        format.json { render json: @professer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professers/1
  # DELETE /professers/1.json
  def destroy
    @professer.destroy
    respond_to do |format|
      format.html { redirect_to professers_url, notice: 'Professer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professer
      @professer = Professer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professer_params
      params.require(:professer).permit(:name, :uni_id)
    end
end
