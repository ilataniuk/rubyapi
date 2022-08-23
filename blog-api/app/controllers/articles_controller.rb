class ArticlesController < ApplicationController

  before_action :article_exists?, only: %i[show edit update destroy]

  def destroy
    @art.destroy
    article_render({}, :no_content)
  end

  def update
    if @art.update(article_params)
      article_render(@art)
    else
      article_render(@art.errors, :unprocesseble_entity)
    end
  end

  def show
    article_render(@art)
  end

  def new
    @art = Article.new
  end

  def root
    redirect_to articles_path
  end

  def create
    @art = Article.new(article_params)
    if @art.save
      article_render(@art, :created)
    else
      article_render(@art.errors, :unprocesseble_entity)
    end
  end

  def index
    @articles = Article.all.order(id: "DESC")
    article_render(@articles)
  end

  private

  def article_exists?
    @art = Article.find_by(id: params[:id])
    article_render({message: 'Article not found' },:not_found) if @art.nil?
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def article_render(data,status=:ok)
    #logger.debug request.method
    if request.headers['HTTP_ACCEPT'] =~ /^application\/json/
      if data.class == 'Article::ActiveRecord_Relation'
        render json: data, status: status, each_serializer: ArticlesSerializer
      else
        render json: data, status: status, serializer: (data.class == 'Article' ? ArticlesSerializer : false)
      end
    # for compatible with React app
    elsif request.method == 'POST' && status == :ok
      redirect_to article_path(@art)
    else
      case status
        when :no_content, :created
          redirect_to articles_path
        when :unprocesseble_entity
          redirect_to article_path(@art)
      end
    end
  end

end
