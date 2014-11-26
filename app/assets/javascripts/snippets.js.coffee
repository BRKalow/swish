# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require ace/ace
//= require ace/worker-html
//= require ace/theme-twilight
//= require ace/mode-ruby

editor = ace.edit("editor")
editor.setTheme("ace/theme/twilight")
editor.getSession().setMode("ace/mode/ruby")
