class HomeController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  def index
  end

  def show
    
  end

  def user_dashboard
    #@titles = current_user.titles.all
    render 'user_dashboard'
  end

  def document_wizard
    render 'docu_wizard_start'
  end
end
