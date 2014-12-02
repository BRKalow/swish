class SnippetsController < ApplicationController
  before_action :set_snippet, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:mine, :favorites, :new]

  respond_to :html

  layout "snippets"

  def index
    @snippets = Snippet.all
    @snippet = Snippet.new
    respond_with(@snippets)
  end

  def show
    puts "----------"
    puts @snippet.user
    puts "----------"
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

  def mine
    unless user_signed_in?
      flash[:error] = "You need to be logged in to see your snippets."
      redirect_to snippets_path
    else
      @snippets = current_user.snippets
    end
  end

  def favorites
    @snippets = current_user.favorites
  end

  private
    def set_snippet
      @snippet = Snippet.find(params[:id])
    end

    def snippet_params
      params.require(:snippet).permit(:language, :title, :body, :num_favorites, :num_views, :num_comments, :user_id)
    end
end
