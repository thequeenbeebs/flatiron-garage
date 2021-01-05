class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if @user.id != session[:user_id]
      redirect_to root_path
    end
  end

  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to signup_path
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != session[:user_id]
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
