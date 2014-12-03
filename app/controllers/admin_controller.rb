class AdminController < ApplicationController
  before_filter :authorize
  def index
    @apps = App.unscoped.where('approved = ?', false)
  end
   def approve
    @app = App.unscoped.find(params[:id])
    @app.update_attribute :approved, true
    redirect_to '/admin/apps'
  end
  private
  def authorize
    if current_user.permissions < 2
      redirect_to '/'
      flash[:notice] = 'You are not an admin!!'
    end
  end
 
end