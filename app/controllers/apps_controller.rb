class AppsController < ApplicationController
  def index
    @apps= App.all
       
    
  end
  def new #get
    @apps = App.new
  end
  def show
    @apps = App.unscoped.find(params[:id])
    @comments = Comment.where("appId = ?", params[:id]).to_a
    
  end
  def post_comment
    @comment = Comment.new
    @comment.comment = params[:body]
    @comment.commentor = current_user.email
    @comment.appID = params[:id]
    unless @comment.save
      flash[:notice] = "rip comment no saverino"
    end
    redirect_to :action => :show, :id => params[:id]
  end
  def delete_comment
    @comment = Comment.find(params[:comment_id]) rescue nil
    unless @comment.nil?
      @comment.destroy
      flash[:notice] = "Comment Deleted"
    end
    redirect_to "/apps/#{params[:app_id]}"
  end
  def create #post
    @apps = App.new
    @apps.name = params[:apps][:name]
    @apps.developer = params[:apps][:developer]
    @apps.price = params[:apps][:price]
    @apps.link = params[:apps][:link]
    @apps.appStore = params[:apps][:appStore]
    @apps.approved = false
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

