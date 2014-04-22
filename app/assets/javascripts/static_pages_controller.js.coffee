# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $("#slides").slidesjs
    width: 940
    height: 200
    pagination:
      active: false
    play:
      active: true
      effect: "fade"
      interval: 10000
      auto: true
    effect:
      fade: 500
    navigation:
      active: false

  if $('#notice').length >0
     $('#notice').slideUp(3000).delay(10000)