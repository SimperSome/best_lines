class Api::V1::AuthorsController < Api::V1::GraphitiController
  def index
    authors = AuthorResource.all(params)
    respond_with(authors)
  end

  def show
    author = AuthorResource.find(params)
    respond_with(author)
  end

  def create
    author = AuthorResource.build(params)

    if author.save
      render jsonapi: author, status: :created
    else
      render jsonapi_errors: author
    end
  end

  def update
    author = AuthorResource.find(params)

    if author.update_attributes
      render jsonapi: author
    else
      render jsonapi_errors: author
    end
  end

  def destroy
    author = AuthorResource.find(params)

    if author.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: author
    end
  end
end
