EmberTodos.Router.map (match)->
  @resource "todos", path: '/', ->
    @route 'active'
    @route 'completed'


EmberTodos.TodosRoute = Ember.Route.extend
  model: ->
    EmberTodos.Todo.find()

EmberTodos.TodosIndexRoute = Ember.Route.extend
  model: ->
    EmberTodos.Todo.find()

EmberTodos.TodosActiveRoute = Ember.Route.extend
  model: ->
    EmberTodos.Todo.filter (todo) ->
      if !todo.get('isCompleted') then true

  renderTemplate: (controller) ->
    @render 'todos/index', controller: controller

EmberTodos.TodosCompletedRoute = Ember.Route.extend
  model: ->
    EmberTodos.Todo.filter (todo) ->
      if todo.get 'isCompleted' then true

  renderTemplate: (controller) ->
    @render 'todos/index', controller: controller