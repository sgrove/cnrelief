class CampaignsController < ApplicationController
  before_filter :get_user
  before_filter :get_campaign, :only => [:show, :update, :destroy, :schedule]
  
  def index
    @campaigns = @user.campaigns
  end

  def show
    @campaign = @user.campaigns.find(params[:id])
  end

  def new
    flash[:notice] = "Let's create a new campaign"
    # @campaign = @user.campaigns.new
    @campaign = Campaign.new
  end

  # POST /campaigns
  # POST /campaigns.xml
  def create
    @campaign = Campaign.new(params[:campaign])
    @campaign.user = current_user

    respond_to do |format|
      if @campaign.save
        flash[:notice] = "Campaign saved! Here's what your campaign will look like"
        format.html { redirect_to campaign_path( @campaign ) }
        format.xml  { render :xml => @campaign, :status => :created, :location => @campaign }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @campaign.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    respond_to do |format|
      if @campaign.update_attributes(params[:user])
        flash[:notice] = "Updated your campaign - it's better than ever."

        format.html {
          redirect_to campaign_path( @campaign )
        }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @campaign.errors, :status => :unprocessable_entity }
      end
    end
  end

  def schedule
    # Put the campaign on the backend queue
    @campaign.schedule!

    flash[:notice] = "Your campaign is scheduled, you should have the results shortly!"
    redirect_to campaigns_path
  end

  def destroy
    redirect_to root_path unless @campaign.user == @user
    @campaign.destroy

    flash[:notice] = "#{@campaign.title} has been deleted, but we'll keep the results (if any) for up to 30 days"

    respond_to do |format|
      format.html { redirect_to campaigns_path }
      format.xml  {  head :ok }
    end
  end

  protected

  def get_user
    redirect_to root_path unless current_user
    @user = current_user
  end

  def get_campaign
    @campaign = Campaign.find params[:id]
  end
end
