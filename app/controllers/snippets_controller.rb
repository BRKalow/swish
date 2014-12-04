class SnippetsController < ApplicationController
  before_action :set_snippet, only: [:show, :edit, :update, :destroy, :favorite]
  before_action :update_views!, only: [:show]
  before_filter :authenticate_user!, only: [:mine, :favorites, :new]

  respond_to :html

  layout 'snippets'

  def index
    if params[:tag]
      @snippets = Snippet.tagged_with(params[:tag]).paginate(
        page: params[:page],
        per_page: 10
      )
    else
      @snippets = Snippet.paginate(page: params[:page], per_page: 10)
    end
    @snippet = Snippet.new
    respond_with(@snippets)
  end

  def show
    @comment = Comment.new
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

  def favorite
    if user_signed_in?
      if current_user.favorites.include? @snippet
        remove_favorite
      else
        current_user.favorites << @snippet
        redirect_to :back
      end
    else
      flash[:error] = 'You need to be signed in to do this.'
      redirect_to :back
    end
  end

  def mine
    if user_signed_in?
      @snippets = current_user.snippets.paginate(
        page: params[:page],
        per_page: 10
      )
    else
      flash[:error] = 'You need to be logged in to see your snippets.'
      redirect_to snippets_path
    end
  end

  def favorites
    @snippets = current_user.favorites.paginate(
      page: params[:page],
      per_page: 10
    )
  end

  private

  def set_snippet
    @snippet = Snippet.find(params[:id])
  end

  def update_views!
    @snippet.num_views.nil? ? @snippet.num_views = 0 : ''
    @snippet.num_views += 1
    @snippet.save!
  end

  def remove_favorite
    current_user.favorites.delete(@snippet)
    @snippet.num_favorites -= 1
    @snippet.save!
    redirect_to :back
  end

  def snippet_params
    params.require(:snippet).permit(:language, :title, :body, :num_favorites,
                                    :num_views, :num_comments, :user_id,
                                    :tag_list, :team_id)
  end
end
