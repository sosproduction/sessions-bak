Sessions.EditTodoView = Ember.TextField.extend
  focusOnInsert: (->
    @.$().val(@.$().val())
    @.$().focus
  ).on('disInsertElement')

Ember.Handlebars.helper('edit-todo', Sessions.EditTodoView)
