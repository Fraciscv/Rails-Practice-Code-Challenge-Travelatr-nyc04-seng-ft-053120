class PostsController < ApplicationController
    before_action :set_post, only: [:edit, :update, ]
    def new
        @post = Post.new
        @errors = flash[:errors]
    end

    def create
        @post = Post.create(post_params)
        if @post.valid?
            redirect_to @post
        else 
            flash[:errors]= @post.errors.full_messages
            redirect_to new_post_path
        end
    end
    
    def edit
        @errors = flash[:errors]
    end

    def update
        if @post.update(post_params)
            redirect_to @post
        else
            flash[:errors]= @post.errors.full_messages
            redirect_to edit_post_path(@post)
        end
    end

    def show
        byebug
        @post.likes += params[:likes] 
    end

private
    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end

    def set_post
        @post = Post.find(params[:id])
    end

end