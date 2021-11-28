class Api::V1::BestLinesController < Api::V1::GraphitiController
  def index
    best_lines = BestLineResource.all(params)
    respond_with(best_lines)
  end

  def show
    best_line = BestLineResource.find(params)
    respond_with(best_line)
  end

  def create
    best_line = BestLineResource.build(params)

    if best_line.save
      render jsonapi: best_line, status: :created
    else
      render jsonapi_errors: best_line
    end
  end

  def update
    best_line = BestLineResource.find(params)

    if best_line.update_attributes
      render jsonapi: best_line
    else
      render jsonapi_errors: best_line
    end
  end

  def destroy
    best_line = BestLineResource.find(params)

    if best_line.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: best_line
    end
  end
end
