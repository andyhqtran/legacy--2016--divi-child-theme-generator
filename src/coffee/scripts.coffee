$('.dashboard-nav__item').on 'click', (e) ->
  e.preventDefault()

  $('.dashboard-nav__item').removeClass 'dashboard-nav__item--active'
  $(this).addClass 'dashboard-nav__item--active'

  itemId = $(this).children().attr 'data-target'

  $('.dashboard-content__panel').removeClass('dashboard-content__panel--active').hide()
  $('.dashboard-content__panel[data-panel=' + itemId + ']').addClass('dashboard-content__panel--active').show()

  console.log(itemId)

# Child Theme Name (Val)
$('#form__child_theme_name').keyup ->
  childThemeName = $(this).val()
  console.log('Theme Name: ' + childThemeName)

# Child Theme URL (Val)
$('#form__child_theme_url').keyup ->
  childThemeUrl = $(this).val()
  console.log('Theme URL: ' + childThemeUrl)

# Version (Val)
$('#form__version').keyup ->
  version = $(this).val()
  console.log('Version: ' + version)

# Parent Theme Name (Val)
$('#form__parent_theme_name').keyup ->
  parentThemeName = $(this).val()
  console.log('Parent Theme: ' + parentThemeName)

# Author Name (Val)
$('#form__author_name').keyup ->
  authorName = $(this).val()
  console.log('Author Name: ' + authorName)

# Author URL (Val)
$('#form__author_url').keyup ->
  authorUrl = $(this).val()
  console.log('Author URL: ' + authorUrl)

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