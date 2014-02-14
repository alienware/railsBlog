class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    all_posts = Post.search(params[:search]).order('id DESC')
		@posts = all_posts.paginate(:page => params[:page], :per_page => 3)
		archive all_posts

		respond_to do |format|
			format.html
			format.js
		end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
		archive Post.all.order('id DESC')
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to '', notice: "Post #{@post.title} was successfully created." }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to '', notice: "Post #{@post.title} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    title = @post.title
		@post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post #{title} was successfully deleted."}
      format.json { head :no_content }
    end
	end

	def archive posts
		#TODO: Convert to a post creation-deletion driven archiving than redundant calculating one
		@months = Hash.new { |hash, key| hash[key] = [] }
		posts.each do |post|
			@months[post.created_at.strftime('%B, %Y')] << post.id
		end
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params[:post].permit(:title, :content)
    end
end
