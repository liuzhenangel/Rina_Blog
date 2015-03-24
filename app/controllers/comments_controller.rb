class CommentsController < ApplicationController
  def index
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params.merge(article_id: params[:article_id]))
    if !@comment.save
      flash[:error] = '添加评论失败'
    end
    redirect_to @article
  end

  private
  def comment_params
    params.require(:comment).permit(:message, :username, :email)
  end
end
