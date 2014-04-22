#binder_clink = () ->
#  $("#this_button").on "click", (event) ->
#    valuesToSubmit = undefined
#    valuesToSubmit = $("#wrapper").find("select,input").serialize()
#    $.ajax
#      type: "POST"
#      url: "/profiles/<%=@profile.id%>/skills"
#      data: valuesToSubmit
#      dataType: "json"
#      success: (data) ->
#        expo = (data["months"])
#        id = (data["id"])
#        name = (data["name"])
#        pro_id="<%=@fghfghhf.id%>"
#        switch
#          when expo == 1
#            cl_tosend = "success round label"
#          when expo == 2
#            cl_tosend = "round label"
#          when expo == 3
#            cl_tosend = "secondary round label"
#        pased = (data["name"])
#        build_link = "<li id='skill_list_item" + id + "'>" + "<a href='#' data-dropdown='drop" +
#        id + "' class='button dropdown success round label'" + ">" + name + "</a>" +
#        "<ul id='drop" + id + "' class='f-dropdown'>" +
#        "<li>" + "<a data-method='delete'  href='/profiles/'"+pro_id + "/skills/" + id + " rel='nofollow'>Delete</a></li></ul></li>"
#        $("#skill_list").append build_link
#
#
#
#$("<%=escape_javascript render(file:'skills/new.html.erb')%>").appendTo "#skills"
#$("#new_skill_link").hide()
#binder_clink()
#
#$("#skill_input").autocomplete
#  source: $('#skill_input').data('autocomplete-source')
## build_link="<li id='skill_list_item" + "<%=@skill.id%>" + "'>" + "<a href='#' data-dropdown='drop" +
##  "<%=@skill.id%>'" + " class='button dropdown success round label'" + "<%=@skill.name%>" + "</a>" +
##  "<ul id='drop" + "<%=@skill.id%>'" + " class='f-dropdown'>" +
##  "<li><%=link_to 'Delete',profile_skill_path(@profile,@skill),method: :delete, remote: true%>" +
##  "</li></ul></li>"

