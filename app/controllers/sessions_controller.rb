class SessionsController < ApplicationController
  def create
    # sessionがnameとマッチした最初のデータを取得する
    # 指定したモデルのインスタンスを返す
    user = User.find_by(name: params[:session][:name])
    # authenticateでパスワードの一致を確認
    if user && user.authenticate(params[:session][:password])
      # session情報にidを持たせる
      session[:user_id] = user.id
      # かなり大変だった！！！！
      # 値を表示するだけならrenderでよい！！！
      @user = User.find_by(id: session[:user_id])

      # application_controllerはsessionコントローラが呼ばれる前に呼ばれる
      # だからここで@current_userに代入しないと、header部が反映されない(@current_userが空っぽ)
      @current_user = User.find_by(id: session[:user_id])
      @follow = Relationship.all
      render 'users/me'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'home/index'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
