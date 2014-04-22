# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
add_endo = (j_dson) ->
  to_send_add=JSON.stringify(j_dson)
  $("#dialog-skills").dialog
    resizable: false
    height: 400
    width: 400
    modal: true
    buttons:
      "Ok": ->
        $.ajax(
          url: '/endorsements'
          type: 'POST'
          data: to_send_add
          contentType: "application/json"
          dataType: "JSON"
          success: (data, textStatus, jqXHR) ->
            $('#dialog-skills').dialog "close"
        )
      Cancel: ->
        $(this).dialog "close"

    $('#skill_name').text(j_dson.skil_name)



delete_endo = (j_dson) ->
  $("#dialog-skills_delete").dialog
    resizable: false
    height: 400
    width: 400
    modal: true
    buttons:
      "Ok": ->
        $('#dialog-skills_delete').dialog "close"
      Cancel: ->
        $(this).dialog "close"

     $('#skill_name_delete').text(j_dson.skil_name)

own_endo = (j_dson) ->
  $("#dialog-skills_own").dialog
    resizable: false
    height: 400
    width: 400
    modal: true
    buttons:
      "Ok": ->
        $('#dialog-skills_own').dialog "close"
      Cancel: ->
        $(this).dialog "close"

    $('#skill_name_own').text(j_dson.skil_name)



jQuery ->
  $("#skill_button").click ->
    valuesToSubmit = $(this).serialize()
    $.ajax(
      url: $(this).attr("action")
      data: valuesToSubmit
      dataType: "JSON"
    ).success



  $("[id^=skillbadge]").click ->
    skill_id = ($(this).attr('id')).match(/[0-9]+/)
    name = $(this).text()
    to_send = new Object()
    to_send.skil_id = skill_id[0]
    to_send.skil_name = name
    j_dson = JSON.stringify(to_send)
    $.ajax(
      url: '/endorsements/check_valid'
      type: 'POST'
      data: j_dson
      contentType: "application/json"
      dataType: "JSON"
      success: (data, textStatus, jqXHR) ->
        if data.message == "true"
          add_endo(to_send)
        else if data.message == "own"
          own_endo(to_send)
        else
          delete_endo(to_send)
    )



  $("#search_result").dataTable()

  $("#search_result tbody tr").on "click", (event) ->
    nTds = $("td", this)
    iD = $(nTds[0]).text()
    window.location.replace("/profiles/#{iD}")
