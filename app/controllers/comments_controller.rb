class CommentsController < ApplicationController
  def create
    photo = Photo.find(params[:photo_id])
    @comment = current_user.comments.new(comment_params)
    @comment.photo_id = photo.id
    @comment.save
    redirect_back(fallback_location: photo_path(photo))
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
