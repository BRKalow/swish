class HomeController < ApplicationController

  def index
    @snippet = Snippet.new
    @snippets = Snippet.all
  end

end
