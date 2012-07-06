class SigninsController < ApplicationController
  def index
    @signin = Signin.new
  end

  def create
    @signin = Signin.new(params[:signin])
  	@signin.save
  	render :action => :show
  end

  def show
  end
end
