module SnippetsHelper
  def user_snippets_link
    return nav_link 'My Snippets', snippets_mine_path if user_signed_in?
  end

  def user_favorites_link
    return nav_link 'My Favorites', snippets_favorites_path if user_signed_in?
  end

  def highlight(text, language)
    capital_languages = %w(HTML CSS PHP SQL XML YAML ERB C)
    if capital_languages.include? language
      lexer_string = "Rouge::Lexers::#{language}"
    else
      lexer_string = "Rouge::Lexers::#{language.capitalize}"
    end
    lexer = lexer_string.constantize
    formatter = Rouge::Formatters::HTML.new(css_class: 'highlight',
                                            line_numbers: true)
    formatter.format(lexer.lex(text)).html_safe
  end

  def favorite_link(snippet)
    return unless user_signed_in?
    snippet_in_favorites = current_user.favorites.include? snippet
    text = snippet_in_favorites ? ' Unfavorite' : ' Favorite'
    icon = snippet_in_favorites ? glyph('heart') : glyph('heart-empty')
    link_to icon + text, favorite_snippet_path(snippet), method: :put
  end

  def linkable_tags(tag_list)
    links = []
    tag_list.each do |tag|
      links << link_to(tag, snippets_path(tag: tag))
    end
    links.join(', ').html_safe
  end
end
