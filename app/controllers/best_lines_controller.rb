class BestLinesController < ApplicationController
  before_action :set_best_line, only: [:show, :edit, :update, :destroy]

  # GET /best_lines
  def index
    @best_lines = BestLine.all
  end

  # GET /best_lines/1
  def show
  end

  # GET /best_lines/new
  def new
    @best_line = BestLine.new
  end

  # GET /best_lines/1/edit
  def edit
  end

  # POST /best_lines
  def create
    @best_line = BestLine.new(best_line_params)

    if @best_line.save
      redirect_to @best_line, notice: 'Best line was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /best_lines/1
  def update
    if @best_line.update(best_line_params)
      redirect_to @best_line, notice: 'Best line was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /best_lines/1
  def destroy
    @best_line.destroy
    message = "BestLine was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to best_lines_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_best_line
      @best_line = BestLine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def best_line_params
      params.require(:best_line).permit(:image, :book_id, :page, :notes, :category_id)
    end
end
