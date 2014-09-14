# For more information see: http://emberjs.com/guides/routing/

Sessions.Router.map ->
  @resource 'todos', path: '/', ->
    @route 'active'
    @route 'completed'

Sessions.TodosRoute = Ember.Route.extend
  model: -> @store.find('todo')

Sessions.TodosIndexRoute = Ember.Route.extend
  setupController: -> @controllerFor('todos').set('filteredTodos', this.modelFor('todos'))

Sessions.TodosActiveRoute = Ember.Route.extend
  setupController: ->
    todos = @store.filter 'todo', (todo) ->
      !todo.get('isCompleted')

    @controllerFor('todos').set('filteredTodos', todos)

Sessions.TodosCompletedRoute = Ember.Route.extend
  setupController: ->
    todos = @store.filter 'todo', (todo) ->
      todo.get('isCompleted')

    @controllerFor('todos').set('filteredTodos', todos)
