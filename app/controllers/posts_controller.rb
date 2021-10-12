class PostsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create]

    def home
    end

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            flash[:success] = 'Post was successful'
            redirect_to @post
        else
            render :new
        end
    end

    private
    def post_params
        params.require(:post).permit(:title,:body)
    end

    # confirms a logged-in user.
    def logged_in_user
        unless helpers.logged_in?
            helpers.store_location
            flash[:danger] = 'Please login'
            redirect_to login_path
        end
    end
end
