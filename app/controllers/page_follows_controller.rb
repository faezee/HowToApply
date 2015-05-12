class PageFollowsController < ApplicationController
  before_action :set_page_follow, only: [:show, :edit, :update, :destroy]

  # GET /page_follows
  # GET /page_follows.json 
  def index
    @page_follows = PageFollow.all
  end

  # GET /page_follows/1
  # GET /page_follows/1.json
  def show
    
  end

  # GET /page_follows/new
  def new
    @page_follow = PageFollow.new
  end

  # GET /page_follows/1/edit
  def edit
  end

  # POST /page_follows
  # POST /page_follows.json
  def create
    @page_follow = PageFollow.new
    @page_follow.folower_type = "User"
    @page_follow.folowee_type = "Uni"
    @page_follow.folower_id = current_user.id
    @page_follow.folowee_id = params[:followee_id]

    

    respond_to do |format|
      if @page_follow.save
        @target = @page_follow.folowee_type.classify.constantize.find(params[:followee_id].to_i)
    
        format.html { redirect_to @target, notice: 'Page follow was successfully created.' }
        format.json { render :show, status: :created, location: @page_follow }
      else
        format.html { render :new }
        format.json { render json: @page_follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_follows/1
  # PATCH/PUT /page_follows/1.json
  def update
    respond_to do |format|
      if @page_follow.update(page_follow_params)
        format.html { redirect_to @page_follow, notice: 'Page follow was successfully updated.' }
        format.json { render :show, status: :ok, location: @page_follow }
      else
        format.html { render :edit }
        format.json { render json: @page_follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_follows/1
  # DELETE /page_follows/1.json
  def destroy

    # @page_follow.folower_type = "user"
    # @page_follow.folowee_type = "uni"
    # @page_follow.folower_id = current_user.id
    # @page_follow.folowee_id = params[:followee_id]
    puts "DDDDDDDDDDDDDDDDDDDDDDDDDDDD"
    puts current_user.id
    puts params[:followee_id]
    puts "DDDDDDDDDDDDDDDDDDDDDDDDDDDD"
    
    @page_follow = PageFollow.where(:folower_type => 'User', :folowee_type => 'Uni', :folower_id => current_user.id, :folowee_id => params[:followee_id].to_i ).first
    @target = @page_follow.folowee_type.classify.constantize.find(params[:followee_id].to_i)
    @page_follow.destroy
    respond_to do |format|
      format.html { redirect_to @target, notice: 'Page follow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_follow
      @page_follow = PageFollow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_follow_params
      params.require(:page_follow).permit(:folowee_type, :folowee_id, :folower_type, :folower_id)
    end    
    def page_follow_create_params
      params.require(:page_follow).permit(:folowee_id)
    end
end
