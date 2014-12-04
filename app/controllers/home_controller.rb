class HomeController < ApplicationController
  def index
    @snippet = Snippet.new
    @snippets = Snippet.paginate(page: params[:page], per_page: 10)
  end
end
