class SnippetsController < ApplicationController
  before_action :set_snippet, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @snippets = Snippet.all
    respond_with(@snippets)
  end

  def show
    respond_with(@snippet)
  end

  def new
    @snippet = Snippet.new
    respond_with(@snippet)
  end

  def edit
  end

  def create
    @snippet = Snippet.new(snippet_params)
    @snippet.save
    respond_with(@snippet)
  end

  def update
    @snippet.update(snippet_params)
    respond_with(@snippet)
  end

  def destroy
    @snippet.destroy
    respond_with(@snippet)
  end

  private
    def set_snippet
      @snippet = Snippet.find(params[:id])
    end

    def snippet_params
      params.require(:snippet).permit(:language, :title, :body, :num_favorites, :num_views, :num_comments)
    end
end
