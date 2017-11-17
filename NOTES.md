For form for adding new course ?

<%= f.fields_for :courses, @user.courses.build do |course_fields| %>
    Add New: <%= course_fields.text_field :name %>
<% end %>
