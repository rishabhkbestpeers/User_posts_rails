class PostsController < ApplicationController

    def index
        if session[:user_id]
           @user = User.find_by(id: session[:user_id])
           @post = @user.posts
        else
            redirect_to :controller => 'posts', :action => 'post'
        end
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = session[:user_id]
        if @post.save
            redirect_to posts_path, notice: "New Post Added Succesfully"
        else
            flash[:alert] = "Something Went Wrong"
            redirect_to new_post_path
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
        @comments = @post.comments
        
    end
    def edit
        @post = Post.find(params[:id])
        
    end
    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to posts_path
        else
            flash[:alert] = "Post in not edited"
            redirect_to edit_post_path
        end
    end
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
   
    end
    
    private
    
    def post_params
        params.require(:post).permit(:title, :description)
    end
end