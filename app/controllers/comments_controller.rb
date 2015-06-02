class CommentsController < ApplicationController
  before_filter :load_commentable
  
  def create
    @comment = @commentable.comments.new(comment_params)
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: 'Komentarz został dodany.' }
        format.js
      else
        format.html { redirect_to @commentable, notice: 'Komentarz nie został dodany.' }
      end
    end
  end

private

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:name, :message, :user_id)
  end
  
  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end