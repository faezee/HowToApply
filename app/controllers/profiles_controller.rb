class ProfilesController < ApplicationController

protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  before_action :set_profile, only: [:show, :edit, :update, :destroy, :showTimeLine]

  # GET /profiles
  # GET /profiles.json

  def showTimeLine
     # @posts = @profile.user.posts
     @posts = Post.all.order("created_at DESC")

     @follower_ids = Friendable.where(:to_id => @profile.user.id).collect { |f| f.from_id}
     @followee_ids = Friendable.where(:from_id => @profile.user.id).collect { |f| f.to_id}
     @followeespost = Post.where(:user_id => @followee_ids) + Post.where(:user_id => @profile.user.id)
     @followeesposts = @followeespost.sort_by{|e| e.created_at}.reverse

     @profile_posts = Post.where(:user_id => @profile.user.id )

  end 

  def notification 
    
  end

  def followables
  end

  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @post = Post.new
    @posts = @profile.user.posts
    @followings = Friendable.where(:from_id => @profile.user.id)
    @followees = Friendable.where(:to_id => @profile.user.id)
    @plans = Plan.all
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    # byebug
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        current_user.profile = @profile
        current_user.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @user_profiles = Profile.where.not(:id => current_user.profile.id).where("name LIKE ? OR familyName like ?", "%#{params[:search_value]}%", "%#{params[:search_value]}%")
    respond_to do |format|
      format.js
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:age, :universityName, :previews, :date_of_birth, :Job, :country, :Gender, 
        :currentUni, :phoneNumber, :name, :familyName, :avatar, :uploaded_file,:search_value)
    end
end
