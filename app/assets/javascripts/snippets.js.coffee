# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require ace/ace
//= require ace/worker-html
//= require ace/theme-twilight
//= require ace/mode-ruby
//= require twitter/typeahead.min

languages_array = ['Ruby', 'HTML', 'CSS', 'Javascript', 'PHP', 'Python', 'Java', 'SQL', 'XML', 'YAML', 'ERB', 'C']

languages = new Bloodhound
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  local: $.map(languages_array, (lang) -> value: lang)

languages.initialize()

@removeCommentWhitespace = (elements) ->
  if elements.length
    elements.each ->
      $(this).html($.trim($(this).text()))
      return

removeCommentWhitespace($('.c'))
removeCommentWhitespace($('.c1'))

if $('#editor').length
  editor = ace.edit("editor")
  editor.setTheme("ace/theme/twilight")
  editor.getSession().setTabSize(2);
  editor.getSession().setMode("ace/mode/ruby")

  editor.getSession().on('change', ->
    $('#snippet_body').val(editor.getSession().getValue())
  )

  $('#snippet_language').typeahead(
    hint: true
    highlight: true,
    minLength: 1
  ,
    name: 'languages',
    displayKey: 'value',
    source: languages.ttAdapter()
  )

  $('#snippet_language').on('change', ->
    editor.getSession().setMode("ace/mode/" + $('#snippet_language').val().toLowerCase())
  )

  $('#snippet_title').keypress((event) ->
    if event.keyCode == 13
      event.preventDefault()
      return
  )
  $('#snippet_language').keypress((event) ->
    if event.keyCode == 13
      event.preventDefault()
      return
  )
