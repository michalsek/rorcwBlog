# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
usersjs = () ->
    $('.lololo').on 'click', (event) ->
        red = Math.floor( Math.random() * 256 )
        green = Math.floor( Math.random() * 256 )
        blue = Math.floor( Math.random() * 256 )
        
        $('body').css({ 'color': 'rgb(' + red + ',' + green + ',' + blue + ')' })
$(document).on('ready', usersjs)
$(document).on('page:load', usersjs)