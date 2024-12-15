class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new create edit update destroy ]

  # GET /posts or /posts.json
  def index
    if (params[:query].nil? || params[:query].blank?) && (params[:tag_ids].nil? || params[:tag_ids].empty?)
      @posts = Post.all.order(trend_score: :desc).includes(:tags)
    else
      query = params[:query].to_s
      tag_ids = Array(params[:tag_ids]).reject(&:blank?).map(&:to_i)
      @posts = Post.search_by_query(query, tag_ids).includes(:tags)
    end
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html # Default behavior for non-Turbo requests
      format.turbo_stream { render partial: "posts/form", locals: { post: @post } }
    end
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.tags = form_tags
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post.tags = form_tags
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_path, status: :see_other, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :text, :user_id, :votes)
    end

    def form_tags
      return [] if params[:tag_ids].nil?
      tag_ids = params[:tag_ids]
      tag_ids.delete("1")
      tags = Tag.where(id: tag_ids)
    end
end
