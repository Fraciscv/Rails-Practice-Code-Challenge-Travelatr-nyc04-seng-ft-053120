class PostsController < ApplicationController
    before_action :set_post, only: [:edit, :update, :show, :like]
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
    end

    def like
        if params[:name] == "dislike"
            @post.dislike
        elsif params[:name] == "like"
            @post.add_like
        end 
        redirect_to post_path(@post)
    end

private
    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end

    def set_post
        @post = Post.find(params[:id])
    end

end