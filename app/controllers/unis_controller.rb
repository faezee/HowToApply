class UnisController < ApplicationController
  before_action :set_uni, only: [:show, :edit, :update, :destroy]

  # GET /unis
  # GET /unis.json
  def index
    @unis = Uni.all
  end

  # GET /unis/1
  # GET /unis/1.json
  def show
    @page_follows = PageFollow.all
  end

  # GET /unis/new
  def new
    @uni = Uni.new
  end

  # GET /unis/1/edit
  def edit
  end

  # POST /unis
  # POST /unis.json
  def create
    @uni = Uni.new(uni_params)

    respond_to do |format|
      if @uni.save
        format.html { redirect_to @uni, notice: 'Uni was successfully created.' }
        format.json { render :show, status: :created, location: @uni }
      else
        format.html { render :new }
        format.json { render json: @uni.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unis/1
  # PATCH/PUT /unis/1.json
  def update
    respond_to do |format|
      if @uni.update(uni_params)
        format.html { redirect_to @uni, notice: 'Uni was successfully updated.' }
        format.json { render :show, status: :ok, location: @uni }
      else
        format.html { render :edit }
        format.json { render json: @uni.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unis/1
  # DELETE /unis/1.json
  def destroy
    @uni.destroy
    respond_to do |format|
      format.html { redirect_to unis_url, notice: 'Uni was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uni
      @uni = Uni.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uni_params
      params.require(:uni).permit(:name)
    end
end
