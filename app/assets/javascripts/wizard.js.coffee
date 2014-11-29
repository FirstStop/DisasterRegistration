# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

hideSteps = ->
  $("*[wizard-node]:not(:first)").hide()

showNextStep = (name) ->
  nextStep = $("*[wizard-node='#{name}']")
  nextStep.show()

  updateProgressIndicator()

  setTimeout ->
    $.smoothScroll({
      scrollTarget: nextStep,
      offset: -30
    })

showSpinner = (element) ->
  $(element).addClass('loading disabled').attr('readonly', 'readonly')
hideSpinner = (element) ->
  $(element).removeClass('loading disabled').attr('readonly', undefined)

getData = ->
  result = {}
  for raw_input in $('input,select,textarea')
    input = $(raw_input)
    result[input.attr 'name'] = input.val() if input.attr 'name'
  result

submitForm = (nextStep) ->
  showSpinner('input[wizard-submit],button[wizard-submit]')
  data = person: getData()
  $.post '/people.json', data, (response) ->
    hideSpinner('input[wizard-submit],button[wizard-submit]')
    updateQRCode(response.id)
    showNextStep(nextStep)

makeFormReadOnly = ->
  $('input,select,textarea').attr('readonly', 'readonly');

updateQRCode = (id) ->
  $("#wizard-qr-code").append "<img width='200' height='200' src='/people/#{id}.png' />"


updateProgressIndicator = ->
  numberOfWizardPages = $('div[wizard-node]').length
  numberOfCompletedWizardPages = $('div[wizard-node]:visible').length

  percentage = numberOfCompletedWizardPages/numberOfWizardPages*100

  $("#wizard-progress .bar").width("#{percentage}%")
  $("#wizard-progress .label").text("#{numberOfCompletedWizardPages} of #{numberOfWizardPages}")

$(document).ready ->
  hideSteps()
  updateProgressIndicator()

  $('input[wizard-next],button[wizard-next]').click ->
    name = $(this).attr('wizard-next')
    showNextStep(name)
    false

  $('input[wizard-submit],button[wizard-submit]').click ->
    nextStep = $(this).attr('wizard-submit')
    submitForm(nextStep)
    makeFormReadOnly()
    false


  #image selector
  $('.image_selector .ui.image').click ->
    $(this).parent().children().removeClass('active')
    $(this).addClass('active')
    $(this).parent().children('input').val($(this).data('img-name'))

