class RepliesController < ApplicationController
  before_action :set_reply, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new create ]

  # GET /replies or /replies.json
  def index
    @replies = Reply.all
  end

  # GET /replies/1 or /replies/1.json
  def show
  end

  # GET /replies/new
  def new
    @post= Post.find(params[:format])
    @reply = @post.replies.new
  end

  # GET /replies/1/edit
  def edit
    @reply = Reply.find(params[:id])
    respond_to do |format|
      format.html # Default behavior for non-Turbo requests
      format.turbo_stream { render partial: "replies/form", locals: { post: @reply } }
    end
  end

  # POST /replies or /replies.json
  def create
    @post = Post.find(params[:post_id])
    @reply = @post.replies.new(reply_params)

    if params[:reply][:parent_reply_id].present?
      @reply.parent_reply_id = params[:reply][:parent_reply_id]
    end

    respond_to do |format|
      if @reply.save
        format.html { redirect_to @post, notice: "Reply was successfully created." }
        format.json { render :show, status: :created, location: @reply }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /replies/1 or /replies/1.json
  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to @reply.post, notice: "Reply was successfully updated." }
        format.json { render :show, status: :ok, location: @reply }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1 or /replies/1.json
  def destroy
    @reply = Reply.find(params[:id])
    @post = @reply.post
    @reply.destroy

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove(@reply)
      end
      format.html { redirect_to post_path(@post), notice: "Reply was successfully deleted." }
    end
  end

  def solve
    @reply = Reply.find(params[:id])
    @reply.solution = true
    @reply.save
    @reply.post.solve
    redirect_to post_path(@reply.post.id)
  end

  def unsolve
    @reply = Reply.find(params[:id])
    @reply.solution = false
    @reply.save
    @reply.post.unsolve
    redirect_to post_path(@reply.post.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reply_params
      params.require(:reply).permit(:text, :user_id, :post_id, :parent_reply_id)
    end
end
