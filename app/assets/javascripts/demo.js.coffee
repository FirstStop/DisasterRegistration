delay = (ms, func) -> setTimeout func, ms

$(document).ready ->
  delay 6000, ->
    $('#person').slideUp 200, ->
      window.location.assign("/demo")
