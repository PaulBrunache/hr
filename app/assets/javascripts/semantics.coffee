$(document).on 'turbolinks:load', ->
  $('.ui.dropdown').dropdown()
  $('.ui.selection.dropdown').dropdown()
  $('.tabular.menu .item').tab()
  $('table').tablesort()
  $('.ui.modal').modal 'show'
  # $('.trigger.example .accordion').accordion selector: trigger: '.title .icon'
  $('.ui.accordion').accordion()
