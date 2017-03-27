# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->

  create_list = ()  ->
    title      = $("#list-title").val()
    csrf_token = $("meta[name='csrf_token']").attr('content')

    if $("#public-option").hasClass('active')
      private_list = "false"
    else
      private_list = "true"

    $("#user-lists").append("<li>
        <a href='#'' data-scroll>
          <span class='fa fa-anchor solo'>" + title + "</span>
        </a>
      </li>")


    $.ajax
      url: '/lists/create'
      type: 'post'
      data: {
        list: {
          authenticity_token: csrf_token
          title:              title
          private:            private_list
        }
      }
      success: (data, textStatus, jqXHR) ->
        $("#new-task-form").html("<h2>" + title + "</h2>" + jqXHR.responseText)

        $("#create-list-div").html('<button type="button" id="edit-list" class="btn btn-success">Update</button>
          <button type="button" id="delete-list" class="btn btn-danger">X</button>')

        $("#list-title").val('')

        $("#list-title").attr("placeholder", "Change list title..").val("").focus().blur();

      error: (jqXHR, textStatus, errorThrown) ->
        # $("#result").html("Erro ! Expressão ou restrições com valores errados.")


  $(document.documentElement).on "click", "#create-list", -> create_list()
