class UsersController < ApplicationController
  def new
    # createでエラーなったときの引数を受け取ってる
    # flashという配列のuserに値入ってる
    @user = User.new(flash[:user])
  end

  def create
    user = User.new(user_params)
    #　passwordが一致してるかもチェックしてる
    if user.save
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      redirect_to :back, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end

  def me
  end

  private 
  
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
