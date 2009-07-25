class CompaniesController < ApplicationController
  before_filter :has_permission_to_modify, :only => [:edit, :update, :create]

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end
  
  protected

  def has_permission_to_modify
    flash[:warnings] = "Sorry, you don't have permission to do that." and redirect_to :back unless current_user.has_permission_to "modify_company"

  end
end
