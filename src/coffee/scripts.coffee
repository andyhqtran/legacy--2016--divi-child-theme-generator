$('.dashboard-nav__item').on 'click', (e) ->
  e.preventDefault()

  $('.dashboard-nav__item').removeClass 'dashboard-nav__item--active'
  $(this).addClass 'dashboard-nav__item--active'

  itemId = $(this).children().attr 'data-target'

  $('.dashboard-content__panel').removeClass('dashboard-content__panel--active').hide()
  $('.dashboard-content__panel[data-panel=' + itemId + ']').addClass('dashboard-content__panel--active').show()

  console.log(itemId)

# Parent Theme Auto Complete
availableThemes = [
  'Extra',
  'Divi',
  'twentyfifteen',
  'twentyfourteen',
  'twentythirteen'
]

$('#form__parent_theme_name').autocomplete({
  source: availableThemes
}, {
  appendTo: $('#form__parent_theme_name').parent()
})

$('#form').submit ->

  childThemeName = $('#form__child_theme_name').val()
  childThemeUrl =  $('#form__child_theme_url').val()
  version = $('#form__version').val()
  parentThemeName = $('#form__parent_theme_name').val()
  authorName = $('#form__author_name').val()
  authorUrl = $('#form__author_url').val()

  if childThemeName != '' && childThemeUrl != '' && version != '' && parentThemeName != '' && authorName != '' && authorUrl != ''

    # Child Theme Name (Val)
    console.log('Theme Name: ' + childThemeName)

    # Child Theme URL (Val)
    console.log('Theme URL: ' + childThemeUrl)

    # Version (Val)
    console.log('Version: ' + version)

    # Parent Theme Name (Val)
    console.log('Parent Theme: ' + parentThemeName)

    # Author Name (Val)
    console.log('Author Name: ' + authorName)

    # Author URL (Val)
    console.log('Author URL: ' + authorUrl)
  else
    console.log('Not Valid');