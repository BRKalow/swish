class FavoriteSnippetsController < ApplicationController
  before_action :set_favorite_snippet, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @favorite_snippets = FavoriteSnippet.all
    respond_with(@favorite_snippets)
  end

  def show
    respond_with(@favorite_snippet)
  end

  def new
    @favorite_snippet = FavoriteSnippet.new
    respond_with(@favorite_snippet)
  end

  def edit
  end

  def create
    @favorite_snippet = FavoriteSnippet.new(favorite_snippet_params)
    @favorite_snippet.save
    respond_with(@favorite_snippet)
  end

  def update
    @favorite_snippet.update(favorite_snippet_params)
    respond_with(@favorite_snippet)
  end

  def destroy
    @favorite_snippet.destroy
    respond_with(@favorite_snippet)
  end

  private

  def set_favorite_snippet
    @favorite_snippet = FavoriteSnippet.find(params[:id])
  end

  def favorite_snippet_params
    params.require(:favorite_snippet).permit(:user_id, :snippet_id)
  end
end
