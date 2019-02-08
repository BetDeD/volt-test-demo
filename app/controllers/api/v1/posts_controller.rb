class Api::V1::PostsController < ApplicationController

  before_action :set_post, only: [:show]

  # GET /posts
  # GET /posts.json
  def index
    page = params[:page]
    per_page = params[:per_page]

    posts = Post.order(published_at: :desc).page(page).per(per_page)

    # Передаём в заголовке общее количество страниц и записей.
    response.headers['Total-Pages'] = posts.total_pages
    response.headers['Total-Count'] = posts.total_count

    render json: posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    render json: @post
  end

  # POST /posts
  # POST /posts.json
  def create
    post = @current_user.posts.create(post_params)

    if post.save
      render json: post
    else
      render json: { errors: post.errors.full_messages }, status: :forbidden
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.permit(:title, :body, :published_at)
  end
end
