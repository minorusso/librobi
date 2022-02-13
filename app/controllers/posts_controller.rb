class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    def new
        @post = Post.new
        @book = Book.find_by(isbn: params[:isbn])
    end
    def create
        @post = current_user.posts.build(post_params)
        @post.save
        redirect_to posts_path
    end
    private
    def post_params
        params.require(:post).permit(:review, :user_id, :)
    end
end
