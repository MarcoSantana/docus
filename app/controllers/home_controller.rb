class HomeController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  def index
  end

  def show
    
  end

  def user_dashboard
    render 'user_dashboard'
  end
end
