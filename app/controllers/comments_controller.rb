class CommentsController < ApplicationController
  def index
  end

  def create
    @article = Article.find(params[:article_id]).to_html
    @comment = Comment.new(comment_params.merge(article_id: params[:article_id]))
    @comments = @article.comments.order(created_at: :desc)
    if !@comment.save
      flash[:error] = '添加评论失败'
      render 'articles/show'
    else
      flash[:notic] = '添加评论成功'
      redirect_to @article
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:message, :username, :email)
  end
end
