$ ->
  pageBody = $('#content')
  templates = Handlebars.templates
  
  showPage = (url, templateFunc) =>
    $.ajax url,
      dataType: 'json',
      success: (data) =>
        pageBody.html(templateFunc(data))
    
  pageBody.on 'click', 'ul li span', (e) ->
    id = $(@).parent().data('id')
    showPage "/api/users/#{id}", templates.user
        
  pageBody.on 'click', '#back-to-users', (e) ->
    showPage '/api/users', templates.users
    
  pageBody.on 'click', 'button.create', (e) ->
    pageBody.html templates.user_add
  
  pageBody.on 'submit', 'form#user-add-form', (e) ->
    e.preventDefault()
    $.ajax "/api/users",
      type: 'POST'
      data: $(@).serialize()
      dataType: 'text'
      success: (x) ->
        showPage '/api/users', templates.users
    
  pageBody.on 'click', 'ul li button.edit', (e) ->
    id = $(@).parent().data('id')
    showPage "/api/users/#{id}", templates.user_edit
  
  pageBody.on 'submit', 'form#user-edit-form', (e) ->
    e.preventDefault()
    id = $(@).data('id')
    $.ajax "/api/users/#{id}",
      type: 'PUT'
      data: $(@).serialize()
      dataType: 'text'
      success: (x) ->
        showPage '/api/users', templates.users
    
  pageBody.on 'click', 'ul li button.delete', (e) ->
    id = $(@).parent().data('id')
    $.ajax "/api/users/#{id}",
      type: 'DELETE'
      dataType: 'text'
      success: ->
        showPage '/api/users', templates.users
        
  showPage '/api/users', templates.users