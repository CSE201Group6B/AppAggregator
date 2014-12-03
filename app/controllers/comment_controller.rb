class CommentsController < ApplicationController
  def new
    @comments = Comment.new
  end
    end
  def create #post
    @comments = App.new
    @comments.comment = params[:comments][:comment]
    @comments.commentor = params[:comments][:commentor]
    
    if @apps.save
      flash[:notice] = "Succesfully saved new app"
      redirect_to "/apps"
    else
      flash[:notice] = "Failed to save app"
      redirect_to "/apps/new"
    end
    
  end
