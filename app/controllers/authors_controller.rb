class AuthorsController < ApplicationController
  before_action :current_user_must_be_author_user,
                only: %i[edit update destroy]

  before_action :set_author, only: %i[show edit update destroy]

  def index
    @q = Author.ransack(params[:q])
    @authors = @q.result(distinct: true).includes(:bibliography, :user,
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
      message = "Author was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @author, notice: message
      end
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
    message = "Author was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to authors_url, notice: message
    end
  end

  private

  def current_user_must_be_author_user
    set_author
    unless current_user == @author.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :year_of_birth, :bio, :image,
                                   :user_id)
  end
end
