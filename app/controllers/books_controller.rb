class BooksController < ApplicationController
  def search
    if params[:keyword]
      @books = RakutenWebService::Books::Book.search(item:[title: params[:keyword]])
      binding.irb
      # @params << RakutenWebService::Books::Book.search(author: params[:keyword])
      # @books = RakutenWebService::Books::Book.search(author: params[:keyword])
      # if params(keyword)
      # @books = RakutenWebService::Books::Book.search(keyword: keyword)

    # if params[:keyword]
    #   @books = RakutenWebService::Books::Book.search(keyword:params[:keyword])
      # binding.irb


    end
  end
end
