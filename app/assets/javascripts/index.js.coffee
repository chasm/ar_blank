$ ->
  showPage = (url, templateFunc) ->
    $.ajax url,
      type: 'GET',
      dataType: 'json',
      success: (data) ->
        $('#content').html(templateFunc(data))
    
  $('section').on 'click', 'ul li span', (e) ->
    id = $(@).parent().data('id')
    showPage "/api/users/#{id}", Handlebars.templates.user
        
  $('section').on 'click', '#back-to-users', (e) ->
    showPage '/api/users', Handlebars.templates.users
    
  $('section').on 'click', 'ul li button.edit', (e) ->
    id = $(@).parent().data('id')
    showPage "/api/users/#{id}", Handlebars.templates.user_edit
    
  $('section').on 'click', 'ul li button.delete', (e) ->
    id = $(@).parent().data('id')
    $.ajax "/api/users/#{id}",
      type: 'DELETE',
      success: ->
        showPage '/api/users', Handlebars.templates.users
  
  $('section').on 'submit', 'form', (e) ->
    e.preventDefault()
    id = $(@).data('id')
    $.ajax "/api/users/#{id}",
      type: 'PATCH',
      data: $(@).serialize(),
      success: (x) ->
        console.log('Success!')
        showPage '/api/users', Handlebars.templates.users
        
  showPage '/api/users', Handlebars.templates.users