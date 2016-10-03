$(document).on 'turbolinks:load', ->
  $('.ui.dropdown').dropdown()
  $('.ui.selection.dropdown').dropdown()
  $('.tabular.menu .item').tab()
  $('.ui.active.modal').modal('show')
  $('table').tablesort()
  $('.ui.modal').modal 'show'
  # $('.trigger.example .accordion').accordion selector: trigger: '.title .icon'
  $('.ui.accordion').accordion()
