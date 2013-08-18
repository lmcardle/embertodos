EmberTodos.Router.map (match)->
  @resource "todos", path: '/'


EmberTodos.TodosRoute = Ember.Route.extend
  model: ->
    EmberTodos.Todo.find()