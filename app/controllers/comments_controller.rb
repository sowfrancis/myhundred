class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @song = Song.find_by(params[:id])
    @comment = current_user.comments.new(params_comment)
    if @comment.save
      redirect_to song_path(@song)
    end
  end

  private

  def params_comment
    params.require(:comment).permit(:content, :song_id, :user_id)
  end
end
