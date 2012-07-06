class SignupsController < ApplicationController
  def index
  	 @signup = Signup.new
  end

  def create
  	@signup = Signup.new(params[:signup])
  	@signup.save
  	render :action => :show
  end
  
  def show
  end
end
