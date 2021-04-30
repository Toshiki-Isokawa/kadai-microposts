class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    user = micropost.user
    current_user.favorite(micropost)
    flash[:success] = 'この投稿をお気に入りに登録しました。'
    redirect_to user
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    user = micropost.user
    current_user.unfavorite(micropost)
    flash[:success] = 'この投稿をお気に入りから解除しました。'
    redirect_to user
  end
end
