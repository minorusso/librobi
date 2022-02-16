class PostsController < ApplicationController
    def index
        @posts = Post.page(params[:page]).reverse_order
    end
    def new
        @post = Post.new
        results = RakutenWebService::Books::Book.search(isbn: params[:isbn])
        @book = Book.new(read(results.first))
    end

    def create
        @book = Book.find_or_initialize_by(isbn: params[:isbn])
        unless @book.persisted?
            results = RakutenWebService::Books::Book.search(isbn: params[:isbn])
            @book = Book.new(read(results.first))
        end
        @book.save
        @post = current_user.posts.build(review: params[:review])
        @post.book_id =  @book.id
        @post.save
        redirect_to posts_path
    end
    def edit
        @post = Post.find(params[:id])
        @book = Book.find_by(id: params[:book_id])
    end
    def update
        post = Post.find(params[:id])
        post.update(post_params)
        redirect_to post_path(id: post.id, book_id: post.book.id )
    end
    def show
        @post = Post.find(params[:id])
        @book = Book.find_by(id: params[:book_id])
        # @comment = Comment.new 
        @comment = @post.comments.build 
        @comments = @post.comments
    end
    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to posts_path
    end

    private
    # def post_params
    #     params.require(:post).permit(:review, :user_id, :book_id)
    # end

  #「楽天APIのデータから必要なデータを絞り込む」、且つ「対応するカラムにデータを格納する」メソッドを設定していきます。
    def read(result)
        title = result["title"]
        author = result["author"]
        url = result["itemUrl"]
        isbn = result["isbn"]
        image_url = result["mediumImageUrl"]
        item_caption = result["itemCaption"]
        {
        title: title,
        author: author,
        url: url,
        isbn: isbn,
        image_url: image_url,
        item_caption: item_caption
        }
    end
end
