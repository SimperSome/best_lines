class AuthorsController < ApplicationController
  before_action :set_author, only: %i[show edit update destroy]

  def index
    @q = Author.ransack(params[:q])
    @authors = @q.result(distinct: true).includes(:bibliography,
                                                  :best_writing).page(params[:page]).per(10)
  end

  def show
    @book = Book.new
  end

  def new
    @author = Author.new
  end

  def edit; end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to @author, notice: "Author was successfully created."
    else
      render :new
    end
  end

  def update
    if @author.update(author_params)
      redirect_to @author, notice: "Author was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @author.destroy
    redirect_to authors_url, notice: "Author was successfully destroyed."
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :dob, :bio, :image)
  end
end
