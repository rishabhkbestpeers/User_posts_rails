class ArticleController < ApplicationController
    def index
        @articles = Article.all
    end
    
    def create
        @dn = params[:company]
        puts @dn
        debugger
    end

    def show

        # Rails.logger.debug params.inspect
        @student = Student.find(params[:id])
        # @articles = Article.find(params[:article_id])
    end
end
