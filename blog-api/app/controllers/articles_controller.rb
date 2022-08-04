class ArticlesController < ApplicationController

  before_action :article_exists?, only: %i[show update destroy]

  def destroy
    @art.destroy
    render json: {}, status: :no_content
  end

  def update
    if @art.update(article_params)
      render json: @art, serializer: ArticlesSerializer, status: :ok
    else
      render json: @art.errors, status: :unprocesseble_entity
    end
  end

  def show
    render json: @art, serializer: ArticlesSerializer
  end

  def create
    @art = Article.new(article_params)
    if @art.save
      render json: @art, serializer: ArticlesSerializer, status: :created
    else
      render json: @art.errors, status: :unprocesseble_entity
    end
  end

  def index
    articles = Article.all
    render json: articles, each_serializer: ArticlesSerializer
  end

  private

  def article_exists?
    @art = Article.find_by(id: params[:id])
    render json: { message: 'Article not found' }, status: :not_found if @art.nil?
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end

end
