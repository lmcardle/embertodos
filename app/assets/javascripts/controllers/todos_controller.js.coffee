EmberTodos.TodosController = Ember.ArrayController.extend
  createTodo: ->
    title = @get 'newTitle'
    if !title.trim()
      return

    todo = EmberTodos.Todo.createRecord
      title: title
      isCompleted: false

    @set 'newTitle', ''

    todo.save()

  remaining: ( ->
    @filterProperty('isCompleted', false).get 'length'
  ).property('@each.isCompleted')

  inflection: ( ->
    remaining = @get('remaining')
    if remaining is 1 then 'item' else 'items'
  ).property('remaining')