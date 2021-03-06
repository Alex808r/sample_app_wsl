class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
      #debugger - отладка в консоли сервера
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user  # можно записать так "redirect_to user_url(@user)" Rails из redirect_to @user автоматически делает вывод о том, что необходимо перенаправить на user_url(@user).
    else
      render 'new'
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
