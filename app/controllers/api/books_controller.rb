class Api::BooksController < ApplicationController
  def index
    @books = Book.all
    render 'index.json.jb'
  end

  def show
    @book = Book.find(params[:id])
    render 'show.json.jb'
  end

  def create
    @book = Book.new(
      title: params[:title],
      pages: params[:pages]
    )
    if @book.save
      render 'show.json.jb'
    else
      render json: { errors: @book.errors.full_messages }
    end
  end
end
