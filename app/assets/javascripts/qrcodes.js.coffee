$ ->
  $qr_scanner = $('#qr_scanner')
  return if $qr_scanner.length == 0

  scannerEnabled = $qr_scanner.data('enabled')
  webkit = false
  moz = false
  action = $('#qr_scanner').data('action')

  setWebcam = ->
    document.getElementById("qr_scanner").style.display = "block"
    scannerEnabled = true
    if navigator.getUserMedia
      navigator.getUserMedia
        video: true
        audio: false
      , setWebcamComplete, setWebcamError
    else if navigator.webkitGetUserMedia
      webkit = true
      window.console.log "webkit"
      navigator.webkitGetUserMedia
        video: true
        audio: false
      , setWebcamComplete, setWebcamError
    else if navigator.mozGetUserMedia
      moz = true
      window.console.log "moz"
      navigator.mozGetUserMedia
        video: true
        audio: false
      , setWebcamComplete, setWebcamError
    return

  closeWebcam = ->
    document.getElementById("qr_scanner").style.display = "none"
    scannerEnabled = false
    $(".dial").trigger('go')
    return

  setWebcamComplete = (stream) ->
    window.console.log "camCapture"

    #var video = document.getElementById("video");
    if webkit
      video.src = window.webkitURL.createObjectURL(stream)
    else if moz
      video.mozSrcObject = stream
      video.play()
    else
      video.src = stream
    setTimeout captureToCanvas, 500
    return

  setWebcamError = ->
    window.console.log "setWebcamError"
    return

  captureToCanvas = ->
    return  unless scannerEnabled
    try
      gCtx.drawImage video, 0, 0
      personId = extractUUIDFromQRCode(qrcode.decode())
      unless $("#person").data("uuid") is personId
        closeWebcam()
        window.location.href = "#{action}?uuid=#{personId}"
    catch e
      console.log e
    setTimeout captureToCanvas, 500
    return

  $('#scan-badge').click -> setWebcam()

  gCanvas = document.getElementById("qr-canvas")
  gCtx = gCanvas.getContext("2d")
  gCtx.clearRect 0, 0, 800, 600
  video = document.getElementById("video")
  setWebcam() if scannerEnabled

  return
