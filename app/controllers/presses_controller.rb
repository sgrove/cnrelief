class PressesController < ApplicationController
  before_filter :require_login

  def index
    @presses = current_user.company.presses
  end

  def show
    @press = current_user.company.presses.find(params[:id])
  end

  def new
    @press = current_user.company.presses.new
  end

  def create
    @press = current_user.company.presses.build(params[:press])

    if @press.save
      flash[:notice] = "We've added the press to your company's resources."
      redirect_to company_press_path(current_user.company, @press)
    else
      render(:action => :new)
    end
  end

  def edit
    @press = current_user.company.presses.find(params[:id])
  end

  def update
    @press = current_user.company.presses.build(params[:press])

    if @press.save
      flash[:notice] = "We've updated your company's press information."
      redirect_to company_press_path(current_user.company, @press)
    else
      render(:action => :edit)
    end
  end

  def destroy
    @press = current_user.company.presses

    if @press.destroy
      flash[:notice] = "We've deleted this press from your company."
      redirect_to company_press_path(current_user.company)
    else
      flash[:warning] = "There was a problem deleting this press."
      redirect_to company_press_path(current_user.company)
    end
  end

  protected

  def require_login
    flash[:warning] = "Sorry, you have to be logged in to do that."
    redirect_to new_user_session_path unless current_user
  end
end
