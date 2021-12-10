class BestLinesController < ApplicationController
  before_action :set_best_line, only: %i[show edit update destroy]

  def index
    @q = BestLine.ransack(params[:q])
    @best_lines = @q.result(distinct: true).includes(:category, :book,
                                                     :user, :author).page(params[:page]).per(10)
  end

  def show; end

  def new
    @best_line = BestLine.new
  end

  def edit; end

  def create
    @best_line = BestLine.new(best_line_params)

    if @best_line.save
      message = "BestLine was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @best_line, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @best_line.update(best_line_params)
      redirect_to @best_line, notice: "Best line was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @best_line.destroy
    message = "BestLine was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to best_lines_url, notice: message
    end
  end

  private

  def set_best_line
    @best_line = BestLine.find(params[:id])
  end

  def best_line_params
    params.require(:best_line).permit(:image, :book_id, :page, :notes,
                                      :category_id, :user_id)
  end
end
