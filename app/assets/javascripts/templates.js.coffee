@arBlank =
  usersTemplate: Handlebars.compile "
    <ul>
      {{#each users}}
        <li data-id=\"{{id}}\">{{name}}</li>
      {{/each}}
    </ul>
  "

  userTemplate: Handlebars.compile "
    {{#each users}}
      <p class=\"user_name\">{{name}}</p>
      <p><a id=\"back-to-users\" href=\"#\">Back to Users</a></p>
    {{/each}}
  "