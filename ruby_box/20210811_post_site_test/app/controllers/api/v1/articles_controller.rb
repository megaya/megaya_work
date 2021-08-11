class Api::V1::ArticlesController < ApiController
  def index
    render json: Article.all
  end

  def show
    @article = Article.find(params[:id])
    render json: @article
  end

  def create
    article = Article.new(article_params)
    if article.save
      render json: article, status: :created
    else
      render json: { errors: article.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.fetch(:article, {}).permit(:name, :text)
  end
end