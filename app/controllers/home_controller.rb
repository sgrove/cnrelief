class HomeController < ApplicationController

  def index

  end

  def main

  end

  def sandbox
    @press = Press.last
    @presses = Press.all
  end

end

