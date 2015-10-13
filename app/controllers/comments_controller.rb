class CommentsController < ApplicationController
  
  #create comment action
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end
  
  #delete comment controller
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
  
  #parameters function
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
  
end
