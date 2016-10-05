$(document).on 'turbolinks:load', ->
  $('.ui.dropdown').dropdown()
  $('.ui.selection.dropdown').dropdown()
  $('.tabular.menu .item').tab()
  $('table').tablesort()
  $('.ui.accordion').accordion()
  REFRESH_INTERVAL_IN_MILLIS = 5000

  setTimeout (->
    Turbolinks.enableTransitionCache true
    Turbolinks.visit location.toString()
    Turbolinks.enableTransitionCache false
    return
  ), REFRESH_INTERVAL_IN_MILLIS
