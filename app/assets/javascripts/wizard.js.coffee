# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

hideSteps = ->
  $("*[wizard-node]:not(:first)").hide()

showNextStep = (name) ->
  next_step = $("*[wizard-node='#{name}']")
  next_step.show()

  setTimeout ->
    $.smoothScroll({
      scrollTarget: next_step,
      offset: -30
    })

getData = ->
  result = {}
  for raw_input in $('input,select,textarea')
    input = $(raw_input)
    result[input.attr 'name'] = input.val() if input.attr 'name'
  result

submitForm = (nextStep) ->
  data = person: getData()
  $.post '/people.json', data, (response) ->
    updateQRCode(response.id)
    showNextStep(nextStep)

makeFormReadOnly = ->
  $('input,select,textarea').attr('readonly', 'readonly');


updateQRCode = (id) ->
  qrcode = new QRCode(document.getElementById("wizard-qr-code"), {
    width : 200,
    height : 200
  });
  qrcode.makeCode(id);

$(document).ready ->
  hideSteps()

  $('input[wizard-next],button[wizard-next]').click ->
    name = $(this).attr('wizard-next')
    showNextStep(name)
    false

  $('input[wizard-submit],button[wizard-submit]').click ->
    name = $(this).attr('wizard-submit')
    submitForm(name)
    makeFormReadOnly()
    false
