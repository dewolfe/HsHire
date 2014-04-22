# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
send_profile_message = (profile_id) ->
  $("#send_message").dialog
    resizeable:true
    height:490
    width:600
    modal: true
    buttons:
      "Send": ->
        to_send=new Object()
        to_send.subject=$('#send_message_subject').val()
        to_send.message=$('#send_message_text').val()
        $.ajax
          type:"POST"
          url: "/profiles/#{profile_id}/send_message"
          data: to_send
          dataType: "JSON"
          success: (data) ->
            $('#send_message').dialog "close"

      Cancel: ->
        $(this).dialog "close"

bind_remove_button = () ->
  $("#remove_resume_button").click ->
     profile_id=$("#profile_id").text()
     $.ajax(
        url: "/profiles/#{profile_id}/remove_resume"
        type: "POST"
        dataType: "json"
        success: (data) ->
          $('#resume_link').replaceWith('<div class="row" id="resume_link" style="padding-top: 15px;"><img src="/assets/document_blank_01.png" style="padding-bottom: 15px;"> </div>');
          $('#add_resume_button').show()
          $("#remove_resume_button").hide()
     )


binder_clink = () ->
  $("#this_button").on "click", (event) ->
    valuesToSubmit = undefined
    valuesToSubmit = $("#wrapper").find("select,input").serialize()
    profile_id=$("#profile_id").text()
    $.ajax
      type: "POST"
      url: "/profiles/#{profile_id}/skills"
      data: valuesToSubmit
      dataType: "json"
      success: (data) ->
        expo = (data["months"])
        id=  (data["id"])
        name= (data["name"])
        pro_id="<%=@profile.id%>"
        switch
          when expo==1
            cl_tosend="success round label"
          when expo==2
            cl_tosend="round label"
          when expo==3
            cl_tosend="secondary round label"
        pased = (data["name"])
        build_link="<li id='skill_list_item" + id + "'>" + "<a href='#' data-dropdown='drop" +
        id + "' class='button dropdown skill_button round label'" + ">" + name + "</a>" +
        "<ul id='drop" + id + "' class='f-dropdown'>" +
        "<li>"+ "<a data-method='delete' data-remote='true' href='/profiles/"+profile_id+
        "/skills/"+id+"'rel='nofollow'>"+"Delete</a></li></ul></li>"
        $("#skill_list").append build_link
        $("#skill_input").val("")


jQuery ->
  profile_id=$("#profile_id").text()
  $("[id^=edit_profile]").fileupload
   dataType: "script"
   progressall: (e, data) ->
     progress = parseInt(data.loaded / data.total * 100, 10)
     $("#load_gif").show()
     $("body").css("cursor", "progress");
   done: (e,data) ->
     $("#load_gif").hide()
     $("body").css("cursor", "auto");
  $("#skill_input").autocomplete
    source: $('#skill_input').data('autocomplete-source')

  $("#new_skill_link").on ("click"),(event) ->
    $("#wrapper").slideDown()
    $("#skill_input").val("")
    $("#new_skill_link").hide()

  $("#skill_cancel_button").on ("click"),(event) ->
     $("#wrapper").slideUp()
     $("#new_skill_link").show()

  $("#search_skill").autocomplete
    source: $('#search_skill').data('autocomplete-source')

  $("#kids_tags").tagsInput()
  $("#just_for_kicks").tagsInput()
  $("#skill_input").keydown (event) ->
    if event.keyCode is 13
      event.preventDefault()
      $("#this_button").click()
      false

  binder_clink()
  bind_remove_button()

  $('#send_message_button').click ->
    send_profile_message(profile_id)

