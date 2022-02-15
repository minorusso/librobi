class CommentsController < ApplicationController
    before_action :set_post, only: [:create, :edit, :update]
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
            format.js { redirect_to post_path(id: @post.id, book_id: @post.book.id ) }
            else
            format.js { redirect_to post_path(id: @post.id, book_id: @post.book.id ), notice: '投稿できませんでした...' }
            end
        end
    end
    def edit
        @comment = @post.comments.find(params[:id])
        respond_to do |format|
            flash.now[:notice] = 'コメントの編集中'
            format.js { render :edit }
        end
    end
    def update
        @comment = @post.comments.find(params[:id])
        respond_to do |format|
            if @comment.update(comment_params)
                flash.now[:notice] = 'コメントが編集されました'
                format.js { render :index }
            else
                flash.now[:notice] = 'コメントの編集に失敗しました'
                format.js { render :edit }
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
    def set_post
        @post = Post.find(params[:post_id])
    end
    
end
