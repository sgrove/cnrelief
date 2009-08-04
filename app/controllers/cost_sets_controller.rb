class CostSetsController < ApplicationController
  before_filter :require_login
  before_filter :get_company

  def index
    cost_sets = @company.cost_sets

    respond_to do |format|
      format.js { render :json => @cost_sets }
    end
  end

  def show
    @cost_set = @company.cost_sets.find(params[:id])

    category = params[:category] || "*"

    respond_to do |format|
      logger.debug "CostSet found: #{@cost_set.name}"
      format.js { 
        @costs = []
        @cost_set.costs.find_all_by_category( category ).each do |cost|
          @costs << {:cost_id => "#{cost.id}", :name => "(#{cost.category}) #{cost.name}"}
        end
        render :json => @costs.to_json }
    end
  end

  protected

  def require_login
    redirect_to login_path unless current_user.logged_in?
  end

  def get_company
    @company = current_user.company
  end

end
