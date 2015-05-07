class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  layout :layout_by_resorce

  def after_sign_up_path_for(user)
  	# byebug
  	if user.profile.present?
  		return profile_path(current_user.profile)
  	else
  		return new_profile_path
  	end
  end

  def after_sign_in_path_for(user)
  	# byebug
  	if user.profile.present?
  		return profile_path(current_user.profile)
  	else
  		return new_profile_path
  	end
  end



  def after_sign_out_path_for(user)
    root_path
  end


  def layout_by_resorce
    if devise_controller?
      'devise'
    else
      'application'
    end
  end

  helper_method :mailbox, :conversation
  private
 
  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end 

  def mailbox
    @mailbox ||= current_user.mailbox
  end
 
end
