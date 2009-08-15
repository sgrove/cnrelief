class PressesController < ApplicationController
  # before_filter :require_login

  def index
    @presses = current_user.company.presses

    respond_to do |format|
      format.html
      format.js  { render :json => @presses }
    end
  end

  def show
    @press = current_user.company.presses.find(params[:id])

    respond_to do |format|
      format.js  { render :json => @press }
    end
  end

  def new
    @press = current_user.company.presses.new
  end

  def create
    @press = current_user.company.presses.build(params[:press])
 
    respond_to do |format|
      if @press.save
        flash[:notice] = "We've added the press to your company's resources."
      format.html { redirect_to company_press_path(current_user.company, @press) }
        format.xml  { render :xml => @press, :status => :created, :location => @press }
        format.json { render :json => @press, :status => :created, :location => @press }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @press.errors, :status => :unprocessable_entity }
        format.json { render :json => @press.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @press = current_user.company.presses.find(params[:id])
  end

  def update
    logger.debug "Entering into the update method..."
    @press = current_user.company.presses.find(params[:id])
    @press.update_attributes(params[:press])

    if true #@press.save
      flash[:notice] = "We've updated your company's press information."
      redirect_to company_press_path(current_user.company, @press)
    else
      render(:action => :edit)
    end
  end

  def destroy
    logger.debug "Entering into the destroy method..."
    
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
