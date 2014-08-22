class SessionsController < ApplicationController

  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user && user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Thank you"
      redirect_to root_path
    else
      @user = User.new(email: params[:user][:email])
      @user.errors[:base] << "Email/ password are invalid"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end