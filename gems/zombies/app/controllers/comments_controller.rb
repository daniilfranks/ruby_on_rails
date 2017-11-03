class CommentsController < ApplicationController

  def create
    @post = Post.find(params[post_id])
    @comment = @post.commetns.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@post, @comment], notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: [@post, @comment] }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:name, :body, :post_id)
    end
end
