class PagesController < ApplicationController
  def home
    if current_user 
      redirect_to dashboard_path
    end
  end

  def dashboard
    @user = current_user
    @places = @user.places 
    @reviews = @user.reviews
  end
end
