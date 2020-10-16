class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @word = Word.find(params[:word_id])
    current_user.favorite(@word)
    flash[:success] = "単語をお気に入りに登録しました。"
    redirect_back(fallback_location: root_path)
      
  end

  def destroy
    @word = Word.find(params[:word_id])
    current_user.unfavorite(@word)
    flash[:success] = "単語のお気に入り登録を解除しました。"
    redirect_back(fallback_location: root_path)
  end
  
end
