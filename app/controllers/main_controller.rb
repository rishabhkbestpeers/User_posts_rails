class MainController < ApplicationController
  def index
    
  end
  def posts
    @posts = Post.all
  end
end