class WelcomeController < ApplicationController
  #comment
  def index
  
    unless params[:appName].nil?
      @apps = App.where("name like ?","%#{params[:appName]}%").to_a 
    end
  end
end