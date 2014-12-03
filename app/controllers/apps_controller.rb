class AppsController < ApplicationController
  def index
    @apps= App.all
       
    
  end
  def new #get
    @apps = App.new
  end
  def show
    @apps = App.find(params[:id])
    @comments = Comment.where("appId = ?", params[:id]).to_a
        
  end
  def create #post
    @apps = App.new
    @apps.name = params[:apps][:name]
    @apps.developer = params[:apps][:developer]
    @apps.price = params[:apps][:price]
    @apps.link = params[:apps][:link]
    @apps.appStore = params[:apps][:appStore]
    
    if @apps.save
      flash[:notice] = "Succesfully saved new app"
      redirect_to "/apps"
    else
      flash[:notice] = "Failed to save app"
      redirect_to "/apps/new"
    end
    
  end
  def edit #get
    @apps = App.find(params[:id])
    
  end
  def update #post
    @apps = App.find(params[:id]) rescue nil
  
    unless @apps.nil? 
    @apps.name = params[:apps][:name]
    @apps.developer = params[:apps][:developer]
    @apps.price = params[:apps][:price]
    @apps.link = params[:apps][:link]
    @apps.appStore = params[:apps][:appStore]
    
      if @apps.save
        flash[:notice] = "Succesfully updated app"
        redirect_to "/apps/#{@apps.id}"
      else
        flash[:notice] = "Failed to save app, please try again."
        redirect_to "/#{@apps.id}/edit"
      end
      return
    end
    flash[:notice] = "Couldn't find an app with that id"
    redirect_to "/"
  end
  
  
end

