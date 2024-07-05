class PostsController < ApplicationController
    def index
        @user = User.find_by(id: session[:user_id])
        @post = @user.posts
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
    end
    def destroy
        debugger
        @post = Post.find_by(id: params[:id])
        @post.destroy
        redirect_to posts_path
    end
    def edit
        @post = Post.find_by(id: params[:id])
    end
    def update
        if @post.update
            redirect_to posts_path
        else
            flash[:alert] = "Post in not edited"
            redirect_to edit_post_path
        end
    end

    private
    
    def post_params
        params.require(:post).permit(:title, :description)
    end
end