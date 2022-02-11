class BooksController < ApplicationController
  def search
    # render :layout => nil

    # if params[:keyword]
    #   @books = RakutenWebService::Books::Book.search(title:params[:keyword])
    # end
    @books = []
    ##@titleに入力されたワードを代入
    @title = params[:title]
    if @title.present?
      results = RakutenWebService::Books::Book.search({
        title: @title,
        hits: 20,
      })

      #@booksにAPIからの取得したJSONデータを格納
      results.each do |result|
        book = Book.new(read(result))
        @books << book
      end
    end

    # #@books内の各データをそれぞれ保存
    # @books.each do |book|
    #   unless Book.all.include?(book)
    #     book.save
    #   end
    # end
  end

  def create
    @book = Book.find_or_initialize_by(isbn: params[:isbn])

    unless @book.persisted?
      results = RakutenWebService::Books::Book.search(isbn: @book.isbn)
      @book = Book.new(read(results.first))
      @book.save
    end
  end
  
  private
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
