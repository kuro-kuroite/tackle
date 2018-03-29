# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  config = {
    defaultDate: "today",
    enableTime: true,
    minDate: "today",
    locale: "ja",
    time_24hr: true,
  }
  datepickers = document.getElementsByClassName('flatpickr')

  for datepicker in datepickers
    datepicker.style.backgroundColor = "white"
    flatpickr(datepicker, config)

  # alert "hello"
