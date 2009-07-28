class OrdersController < ApplicationController
  protect_from_forgery :only => [:create, :update, :destroy]
#form_for @order do |f|

  def new
    @order = Order.new
  end

  def test
    @test_values_passed = params[:person]
  end

end

