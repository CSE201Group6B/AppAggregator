class WelcomeController < ApplicationController
  #comment
  def index
  
    unless params[:appName].nil?
      @apps = App.all.where("name like ?","%#{params[:appName]}%").to_a
    end
  end
end