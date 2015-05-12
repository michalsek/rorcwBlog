class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:comment][:post_id])
    @comment.post = @post
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Komentarz został dodany.' }
      else
        format.html { redirect_to @post, notice: 'Komentarz nie został dodany.' }
      end
    end
  end

private

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:name, :message, :user_id)
  end
end
