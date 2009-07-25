class ClientsController < ApplicationController
  before_filter :has_permission_to_create, :only => [:create]
  before_filter :has_permission_to_update, :only => [:update]
  before_filter :has_permission_to_destroy, :only => [:destroy]

  before_filter :get_company

  def index
    @clients = @company.clients
  end

  def show
    @client = @company.clients.find(params[:id])
  end

  def new
    @client = @company.clients.new
  end

  def edit
    @client = @company.clients.find(params[:id])
  end

  def create
    @client = Client.new(params[:client])

    # TODO: Add iphone pseudo-MIME-type for respond_to |format| block
    respond_to do |format|
      if @client.save
        flash[:notice] << "Great, we've added #{@client} to your clients!"
        redirect_to :action => "index" # Should this redirect to show instead?
        format.html { redirect_to :action => "index" }
        format.xml  { head :ok }
      else
        flash[:warning] << "There were some problems creating this new client."
        format.html { render :action => "edit" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end

  end

  def update
    @client = @company.clients.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        flash[:notice] = 'Your client was successfully updated.'
        format.html { redirect_to(@client) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.clients.find(params[:id]).destroy
    redirect_to company_clients_path( @company )
  end

  protected

  def get_company
    @company = Company.find(params[:company_id])
  end

  # TODO: Replace these with magic has_permission_to_* ? Would make it read more nicely
  def has_permission_to_create
    flash[:warnings] = "Sorry, you don't have permission to do that." and redirect_to :back unless current_user.has_permission_to "create_client"
  end

  def has_permission_to_update
    flash[:warnings] = "Sorry, you don't have permission to do that." and redirect_to :back unless current_user.has_permission_to "update_client"
  end

  def has_permission_to_destroy
    flash[:warnings] = "Sorry, you don't have permission to do that." and redirect_to :back unless current_user.has_permission_to "destroy_client"
  end
end
