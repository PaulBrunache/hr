$(document).on 'turbolinks:load', ->
  $('.ui.dropdown').dropdown()
  $('.ui.selection.dropdown').dropdown()
  $('.tabular.menu .item').tab()
  $('.ui.active.modal').modal('show')
  $('.ui.cards .image').dimmer(on: 'hover')
  $('table').tablesort()
