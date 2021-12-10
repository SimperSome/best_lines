class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true).includes(:author, :best_lines,
                                                :readers).page(params[:page]).per(10)
  end

  def show
    @best_line = BestLine.new
  end

  def new
    @book = Book.new
  end

  def edit; end

  def create
    @book = Book.new(book_params)

    if @book.save
      message = "Book was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @book, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    message = "Book was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to books_url, notice: message
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :publishing_year, :author_id, :cover)
  end
end
