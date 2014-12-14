# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@filter = (input) ->
  value = $(input).val().toLowerCase()
  $('#user-collections > li').each ->
    if $(this).text().toLowerCase().search(value) > -1
      $(this).show()
      return
    else
      $(this).hide()
      return
  return

