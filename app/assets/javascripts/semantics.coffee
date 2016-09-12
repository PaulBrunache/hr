$(document).on 'turbolinks:load', ->
  $('.ui.dropdown').dropdown()
  $('.tabular.menu .item').tab()
  $('.ui.active.modal').modal('show')
  $('.ui.cards .image').dimmer(on: 'hover')
