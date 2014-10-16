delay = (ms, func) -> setTimeout func, ms

$(document).ready ->
  redirect_delay = $('#demo').data('delay')
  return unless redirect_delay
  delay redirect_delay, ->
    $('#person').slideUp 200, ->
      window.location.assign("/demo")
