class HomeController < ApplicationController
  def index
    flash[:notice] = "hi, there!"
  end
end
