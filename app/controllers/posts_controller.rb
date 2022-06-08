class PostsController < ApplicationController
    def index
        @posts = Post.page(params[:page]).reverse_order
    end
    def new
        @post = Post.new
        # bookのshowページから遷移する際にパラメータで本の識別番号isbnを飛ばす
        results = RakutenWebService::Books::Book.search(isbn: params[:isbn])
        @book = Book.new(read(results.first))
    end
        # 投稿ボタンが押されると
    def create
        @book = Book.find_or_initialize_by(isbn: params[:isbn])
        unless @book.persisted?
            results = RakutenWebService::Books::Book.search(isbn: params[:isbn])
            @book = Book.new(read(results.first))
        end
        @book.save
        @post = current_user.posts.build(review: params[:review], rate: params[:rate])
        @post.book_id =  @book.id
        post_find = Post.where(book_id: @book.id).where(user_id: current_user.id)
        post_count = post_find.count
        if post_count < 1
            if @post.save
                redirect_to posts_path, notice: "レビューを保存しました"
            elsif @post.review.present? 
                redirect_to posts_path, notice: "140字以内で入力してください"
            else
                redirect_to posts_path, notice: "レビューを入力してください"
            end
        else
            redirect_to posts_path, notice: "一度レビューしています。編集してください。"
            # redirect_to edit_post_path(id: post_find.first.id, book_id: @post.book.id), notice: "レビューの投稿は一度までです"
        end

    end
    def edit
        @post = Post.find(params[:id])
        @book = Book.find_by(id: params[:book_id])
    end
    def update
        post = Post.find(params[:id])
        if post.update(review: params[:review], rate: params[:rate])
            redirect_to post_path(id: post.id, book_id: post.book.id )
        elsif post.review.present? 
            redirect_to post_path(id: post.id, book_id: post.book.id ), notice: "140字以内で入力してください"
        else
            redirect_to post_path(id: post.id, book_id: post.book.id ), notice: "レビューを入力してください"
        end
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
        publishername = result["publisherName"]
        url = result["itemUrl"]
        isbn = result["isbn"]
        image_url = result["largeImageUrl"]
        item_caption = result["itemCaption"]
        {
        title: title,
        author: author,
        publishername: publishername,
        url: url,
        isbn: isbn,
        image_url: image_url,
        item_caption: item_caption
        }
    end
end
