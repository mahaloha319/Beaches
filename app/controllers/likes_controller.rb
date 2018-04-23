class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(beach_id: params[:beach_id])
    redirect_to beaches_url, notice: "#{@like.beach.user.name}さんのBeachをいいね！しました"
  end
 
  def show
    @user = User.find(params[:id])
    @like_beaches = @user.like_beaches
  end

  def destroy
    like = current_user.likes.find_by(beach_id: params[:beach_id]).destroy
    redirect_to beaches_url, notice: "#{like.beach.user.name}さんのいいね！を解除しました"
  end
end
