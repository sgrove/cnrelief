class OrdersController < ApplicationController

  def new
    @order = Order.new

    @order.quantities.build
    @order.sections.build
    @order.sections.each{|t| t.costs.build}
    @order.quoted_on = Date.today.to_s(:en_US)
    @order.estimator = @order.quoter = current_user

    #render :layout => 'new_edit_order'
  end

  def create
    @order = Order.new(params[:order])
    @order.save ? redirect_to(company_clients_path( current_user.company )) : render(:action => :new)
  end

end

