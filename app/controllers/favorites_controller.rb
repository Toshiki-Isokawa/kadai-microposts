class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = 'この投稿をお気に入りに登録しました。'
    redirect_to User.find(params[:micropost_id])
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'この投稿をお気に入りから解除しました。'
    redirect_to User.find(params[:micropost_id])
  end
end
