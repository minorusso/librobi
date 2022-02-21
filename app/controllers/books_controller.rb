class BooksController < ApplicationController
  
  def rank
    @books = []
      results = RakutenWebService::Books::Book.search({
        booksGenreId: "001004",
        # 漫画
        # booksGenreId: "001001",
        sort: "sales",
        hits: 10,
        outOfStockFlagoutOfStockFlag: 1
      })
      #@booksにAPIからの取得したJSONデータを格納
      results.each do |result|
        book = Book.new(read(result))
        @books << book
      end
  end
  
  def search
    @books = []
    @title = params[:title]
    if @title.present?
      results = RakutenWebService::Books::Book.search({
        title: @title,
        hits: 20,
        outOfStockFlagoutOfStockFlag: 1
      })

      #@booksにAPIからの取得したJSONデータを格納
      results.each do |result|
        book = Book.new(read(result))
        @books << book
      end
    end
  end

  # def create
  #   @book = Book.find_or_initialize_by(isbn: params[:isbn])
  #   unless @book.persisted?
  #     results = RakutenWebService::Books::Book.search(isbn: @book.isbn)
  #     @book = Book.new(read(results.first))
  #     # @book.save
  #   end
  #   # render :show
  #   redirect_to books_show_path(isbn: @book.isbn)
  # end
  

  def show
    @book = Book.find_or_initialize_by(isbn: params[:isbn])
    results = RakutenWebService::Books::Book.search(isbn: @book.isbn)
    @book = Book.new(read(results.first))
  end




  
  private
  #「楽天APIのデータから必要なデータを絞り込む」、且つ「対応するカラムにデータを格納する」メソッドを設定していきます。
  def read(result)
    title = result["title"]
    author = result["author"]
    url = result["itemUrl"]
    isbn = result["isbn"]
    image_url = result["largeImageUrl"]
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
