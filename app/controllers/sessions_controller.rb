class SessionsController < ApplicationController
  def create
    # sessionがnameとマッチした最初のデータを取得する
    # 指定したモデルのインスタンスを返す
    user = User.find_by(name: params[:session][:name])
    # authenticateでパスワードの一致を確認
    if user && user.authenticate(params[:session][:password])
      # session情報にidを持たせる
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      render 'home/index'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
