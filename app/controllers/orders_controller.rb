class OrdersController < ApplicationController

  def new
    @order = Order.new
    @order.quoted_on = Date.today.to_s(:en_US)
    @order.estimator = @order.quoter = current_user
  end

  def create
    @order = Order.new(params[:order])
    @order.save ? redirect_to(company_clients_path( current_user.company )) : render(:action => :new)
  end

end

