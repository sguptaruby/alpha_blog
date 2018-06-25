class ArticlesController < ApplicationController 

    def new
        @article = Article.new
    end

    def create
        #render plain: params[:article].inspect
        @article = Article.new(article_params)

        if @article.save
        flash[:notice] = "Article was successful create."
        redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def index
        @article = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article edit successfuly."
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "Article was successfully deleted"
        redirect_to articles_path
    end

    private
    def article_params
        #params.require:(:article).permit(:title, :description)
        params.require(:article).permit(:title, :description)
    end
end