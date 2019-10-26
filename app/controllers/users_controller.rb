class UsersController < ApplicationController
  def new
    # createでエラーなったときの引数を受け取ってる
    # flashという配列のuserに値入ってる
    #この指定により、エラーでもデータがフォームに残る
    @user = User.new(flash[:user])
  end

  def create
    @user = User.new(user_params)
  
    #user = User.find_by(id: params)
    #　passwordが一致してるかもチェックしてる
    if @user.save
      session[:user_id] = @user.id
      #redirect_to mypage_path
      # いらない説
      redirect_to edit_user_path(@user)
    else
      redirect_to :back, flash: {
        user: @user,
        error_messages: @user.errors.full_messages
      }
    end
  end

  def edit
    # これやるいみある？
    # user = User.new(user_params)
    
    #ここの変数はどっちでもよかった？
    #idを取得したほうが情報がいろいろ紐づいている

    @user = User.find_by(id: session[:user_id])

    # @user =  User.new(user_params)
  end

  def me

    if params[:name].nil?
      @user = User.find_by(id: session[:user_id])
    else
      # ネスト化されたないからあまりよろしくないっぽい（permit通してない）
      @user = User.find_by(name: params[:name])
    end

    @follow = Relationship.all

    # empty?はだめだし、 @user.age=nilもダメだった
    
    if @user.age.nil? then
        @user.age = "22"
        @user.gender = "男"
        @user.myprofile = user_params[:myprofile]
        @user.image = user_params[:image]
    end

    # この記述だとname.,passwordが初期化されてしまう
    # @user = User.new(user_params)
    
    # params[:user].delete("password")
    # params[:user].delete("password_confirmation")
    
    # このやり方はよろしくないかも・・・
    if @user.save(validate: false)
      #redirect_to mypage_pathbin
    else
      redirect_to :back, flash: {
        user: @user,
        error_messages: @user.errors.full_messages
      }
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :image, :age, :gender, :myprofile)
  end

end
