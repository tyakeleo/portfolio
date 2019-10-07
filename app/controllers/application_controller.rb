class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # 全てのアクションの前に呼び出される。
  # このクラスをすべてのコントローラが継承してる
  before_action :current_user

  private 

  def current_user
    # セッションにidが入ってなければ、ログインしていない
    # この時、@current_user変数の値はnilになる
    return unless session[:user_id]
    # idが存在していれば、のユーザが格納される
    @current_user = User.find_by(id: session[:user_id])
  end

end
