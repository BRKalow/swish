module SnippetsHelper
  def user_snippets_link
    if user_signed_in?
      return nav_link "My Snippets", snippets_mine_path 
    end
  end
end
