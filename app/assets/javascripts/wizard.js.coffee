# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("*[wizard-node]:not(:first)").hide()

  $('input[wizard-next],button[wizard-next]').click ->
    next_step_name = $(this).attr('wizard-next')

    next_step = $("*[wizard-node='#{next_step_name}']")
    next_step.show()

    setTimeout ->
      $.smoothScroll({
        scrollTarget: next_step
      })

    false
