$(document).ready ->
  $('.ui.dropdown').dropdown()
  $('.ui.selection.dropdown').dropdown()
  $('.tabular.menu .item').tab()
  $('table').tablesort()
  $('.ui.accordion').accordion()
  $('.mobile-click').click ->
    if ($(".sidebar-menu-container").is(":visible"))
      $('.sidebar-menu-container').toggle()
    else
      $('.sidebar-menu-container').css('display', 'flex')
