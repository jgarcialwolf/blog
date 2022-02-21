class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @comment = Comment.find(params[:id])
    article = @comment.article
    @comment.destroy
    redirect_to article_path(article), status: :see_other
  end
  
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
  