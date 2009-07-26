class ClientsController < ApplicationController
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
        flash[:notice] = "Great, we've added #{@client} to your clients!"
        format.html { redirect_to company_clients_path( @company ) }
        format.xml  { head :ok }
      else
        flash[:warning] = "There were some problems creating this new client."
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
end
