class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:destroy]

  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def destroy
    current_user_session.destroy
    reset_lockdown_session
    flash[:notice] = "Logout successful."
    redirect_to root_path
  end

  private

  def require_no_user
    redirect_to root_path if current_user
  end

  def require_user
    redirect_to root_path unless current_user
  end
end
