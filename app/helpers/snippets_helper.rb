module SnippetsHelper
  def user_snippets_link
    if user_signed_in?
      return nav_link "My Snippets", snippets_mine_path
    end
  end

  def user_favorites_link
    if user_signed_in?
      return nav_link "My Favorites", snippets_favorites_path
    end
  end

  def highlight(text, language)
    lexer_string = "Rouge::Lexers::#{language.capitalize}"
    lexer = lexer_string.constantize
    formatter = Rouge::Formatters::HTML.new(css_class: 'highlight', line_numbers: true)
    formatter.format(lexer.lex(text)).html_safe
  end

  def favorite_link(snippet)
    if user_signed_in?
      text = current_user.favorites.include?(snippet) ? ' Unfavorite' : ' Favorite'
      icon = current_user.favorites.include?(snippet) ? glyph('heart') : glyph('heart-empty')

      link_to icon + text, favorite_snippet_path(snippet), method: :put
    end
  end
end
