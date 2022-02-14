class PostsController < ApplicationController
    def index
        # @post = Post.first
        @posts = Post.all
    end
    def new
        @post = Post.new
        @book = Book.find_by(id: params[:id])
    end
    def create
        @post = current_user.posts.build(post_params)
        # @post.user_id = current_user.id
        # @book = Book.find_by(isbn: params[:book_isbn])
        # @post.book_isbn = @book.isbn
        @post.save
        # binding.irb
        redirect_to posts_path
    end
    def edit
        @post = Post.find(params[:id])
        @book = Book.find_by(id: params[:id])
    end
    def show

    end
    def destroy

    end

    private
    def post_params
        params.require(:post).permit(:review, :user_id, :book_id)
    end
end
