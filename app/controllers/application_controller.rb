class ApplicationController < ActionController::Base
  helper_method :current_user, :authenticated?
  
  def authenticated?
    if current_user.nil?
      redirect_to login_path, notice: 'You must login or signup before proceeding'
    end
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end
