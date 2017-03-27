# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->

  create_task = () ->
    description     = $("#task-area").val()
    csrf_token      = $("meta[name='csrf_token']").attr('content')
    current_list_id = $("#current_list_id").val()

    console.log(current_list_id)

    $.ajax
      url: '/tasks/create'
      type: 'post'
      data: {
        task: {
          authenticity_token: csrf_token
          description:        description
          list_id:            current_list_id
        }
      }
      success: (data, textStatus, jqXHR) ->
        $("#new-task-form").html(jqXHR.responseText)

        $("#new-task").append("<div class='panel panel-body panel-default'><p>" + description + "</p></div><hr />")

      error: (jqXHR, textStatus, errorThrown) ->
        # $("#result").html("Erro ! Expressão ou restrições com valores errados.")


  $(document.documentElement).on "click", "#create-task", -> create_task()