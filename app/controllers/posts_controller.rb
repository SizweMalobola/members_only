class PostsController < ApplicationController
    def home
    end

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:user_id])
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
        params.require(:post).premit(:title,:body)
    end
end
