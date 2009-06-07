class UsersController < ApplicationController
  layout 'application'
  
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    # TODO: Move to campaigns#new
    flash[:notice] = "Let's create a new campaign"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = current_user
    @initial_run = false
    @initial_run = true if @user.full_name.nil? # Is this too hackish? I don't want to add another useless field to the database
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'Welcome to ABTacular! Why not fill in your profile to get started?'
        format.html { redirect_to edit_user_path( :current ) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = current_user

    # Is this the user's first time updating their profile? If so, let's direct them to the campaign creation page
    # Tried checking if new by created_at == updated_at, but current_user under authlogic updates the entry :P
    # Bastard. So now we have a lame check that if the name was empty, we assume it's their first run
    logger.info("User.full_name: #{@user.full_name}, param: #{params[:user][:full_name]}")
    initial_run = true if @user.full_name.nil? and params[:user][:full_name] != nil

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'Updated your profile - believe me, it looks great.'

        format.html {
          logger.info("Initial run? #{initial_run}")
          redirect_to dashboard_path and return unless initial_run

          logger.info("Initial run, redirecting to new campaign path")
          redirect_to new_campaign_path, :params => { :initial_run => true}
        }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
