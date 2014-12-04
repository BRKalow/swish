# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require twitter/typeahead.min

if $('#joining_user').length
    users = new Bloodhound
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        limit: 10
        local: $.map(gon.users, (user) -> name: user.username)

    users.initialize()

    $('#joining_user').typeahead(
        hint: true
        highlight: true,
        minLength: 2
      ,
        name: 'users',
        displayKey: 'name',
        source: users.ttAdapter()
      )

