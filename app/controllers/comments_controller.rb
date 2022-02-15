class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = current_user.comments.new(comment_params.merge(user_id: params[:user_id], post_id: params[:post_id]))
        # @comment = @post.comments.build(comment_params.merge(user_id: params[:user_id], post_id: params[:post_id]))
        # @comment = current_user.comments.new(comment_params)
        # comment.post_id = post.id
        # comment.save
        # redirect_to post_path(id: post.id, book_id: post.book.id )
        respond_to do |format|
            if @comment.save
            format.html { redirect_to post_path(id: @post.id, book_id: @post.book.id ) }
            else
            format.html { redirect_to post_path(id: @post.id, book_id: @post.book.id ), notice: '投稿できませんでした...' }
            end
        end
    end
    
    def destroy
        Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
        # link_to  削除でbook_idも送る必要がある
        redirect_to post_path(id: params[:post_id], book_id: params[:book_id] )
    end
    
    private

    def comment_params
        params.require(:comment).permit(:comment)
    end
    
end
