delay = (ms, func) -> setTimeout func, ms

$(document).ready ->
  redirect_delay = $('#demo').data('delay')
  return unless redirect_delay
  delay redirect_delay, ->
    $('#person').transition
      animation : 'fade up'
      duration  : '2s'
      complete  : -> window.location.assign("/demo")
