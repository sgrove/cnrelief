class OrdersController < ApplicationController

  def index
    @orders = current_user.company.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new

    @order.quantities.build
    @order.sections.build
    @order.sections.each{|s| s.costs.build}
    @order.quoted_on = Date.today.to_s(:en_US)
    @order.estimator = @order.quoter = current_user

  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      flash[:notice] = "Great, we've created a new order entry."
      redirect_to(company_orders_path( current_user.company ))
    else
      flash[:warning] = "Sorry, there were some problems"
      render(:action => :new)
    end
  end

  def edit
    @order = Order.find(params[:id])

    render :action => :new
  end

  def update
    @order = Order.find(params[:id])

    @order.attributes = params[:order]
    if @order.save
      flash[:notice] = "Great, we've updated this order."
      redirect_to @order
    else
      flash[:warning] = "Sorry, there were some problems updating the order."
      render :action => :new
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = "Successfully destroyed order."
    redirect_to company_orders_path(current_user.company)
  end

  def jsonget
    @jsonstr = '[{"contact": {"name":null,"contactable_type":"User","middle":null,"created_at":"2009-08-03T00:34:04Z","contactable_id":1,"updated_at":"2009-08-03T00:43:35Z","last":"Grove","id":1,"first":"Sean","email":"sgrove@freshpress.com"}}]'
  end

end

