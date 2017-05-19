# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  document.addEventListener 'turbolinks:load', ->
    $('[data-provider="summernote"]').each ->
      $(this).summernote()


$ ->
  if $('.pagination').length && $('#posts').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Loading more Articles")
        $.getScript(url)
    $(window).scroll()
