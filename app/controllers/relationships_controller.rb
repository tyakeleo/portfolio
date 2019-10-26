class RelationshipsController < ApplicationController
    before_action :set_user

    def create
        user = User.find(params[:follow_id])
        following = @current_user.follow(user)
        following.name = user.name
        following.image = user.image
        following.image_url = user.image.url
        following.myprofile = user.myprofile
        
        if following.save
            flash[:success] = 'ユーザーをフォローしました'
            redirect_to mypage_path(name: user.name)
        else
            flash.now[:alert] = 'ユーザーのフォローに失敗しました'
            redirect_to mypage_path(name: user.name)
        end
    end

    def destroy
        user = User.find(params[:follow_id])
        following = @current_user.unfollow(user)
        if following.destroy
            flash[:success] = 'ユーザーのフォローを解除しました'
            redirect_to mypage_path(name: user.name)
        else
            flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
            redirect_to mypage_path(name: user.name)
        end
    end

    private

    def set_user
        user = User.find(params[:follow_id])
    end

end
