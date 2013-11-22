$ ->
  showPage = (url, templateFunc) ->
    $.ajax url,
      type: 'GET',
      dataType: 'json',
      success: (data) ->
        $('#content').html(templateFunc(data))
    
  $('section').on 'click', 'ul li', (e) ->
    id = $(@).data('id')
    showPage "/api/users/#{id}", arBlank.userTemplate
        
  $('section').on 'click', '#back-to-users', (e) ->
    showPage '/api/users', arBlank.usersTemplate
        
  showPage '/api/users', arBlank.usersTemplate