class FriendablesController < ApplicationController
  before_action :set_friendable, only: [:show, :edit, :update, :destroy]

  def friend_request
    from_id = current_user.id
    to_id = params[:id] # this is the id of the user you want to become friend with
    followings = Friendable.where(:from_id => current_user.id)
    followees = Friendable.where(:to_id => current_user.id)

    @f = Friendable.where(:from_id => from_id, :to_id => to_id)

    if @f.blank?
      friendable = Friendable.create(from_id: from_id, to_id: to_id, accepted: true)
    else
      @f.first.destroy
    end
    
  end

  # def friend_request_accept
  #   # accepting a friend request is done by the recipient of the friend request.
  #   # thus the current user is identified by to_id.
  #
  #   friendable = Friendable.where(to_id: current_user.id, from_id: params[:id]).first
  #   friendable.update_attributes(accepted: true)
  # end
  #
  # def friend_request_reject
  #   friendable = Friendable.where(to_id: current_user.id, from_id: params[:id]).first
  #   friendable.destroy
  # end

  # GET /friendables
  # GET /friendables.json
  def index
    @friendables = Friendable.all
  end

  # GET /friendables/1
  # GET /friendables/1.json
  def show
  end

  # GET /friendables/new
  def new
    @friendable = Friendable.new
  end

  # GET /friendables/1/edit
  def edit
  end

  # POST /friendables
  # POST /friendables.json
  def create
    @friendable = Friendable.new(friendable_params)

    respond_to do |format|
      if @friendable.save
        format.html { redirect_to @friendable, notice: 'Friendable was successfully created.' }
        format.json { render :show, status: :created, location: @friendable }
      else
        format.html { render :new }
        format.json { render json: @friendable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friendables/1
  # PATCH/PUT /friendables/1.json
  def update
    respond_to do |format|
      if @friendable.update(friendable_params)
        format.html { redirect_to @friendable, notice: 'Friendable was successfully updated.' }
        format.json { render :show, status: :ok, location: @friendable }
      else
        format.html { render :edit }
        format.json { render json: @friendable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendables/1
  # DELETE /friendables/1.json
  def destroy
    @friendable.destroy
    respond_to do |format|
      format.html { redirect_to friendables_url, notice: 'Friendable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendable
      @friendable = Friendable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendable_params
      params.require(:friendable).permit(:from_id, :to_id, :accepted)
    end
end
