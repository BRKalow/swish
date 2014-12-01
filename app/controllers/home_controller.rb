class HomeController < ApplicationController

  def index
    @snippet = Snippet.new
  end

end
