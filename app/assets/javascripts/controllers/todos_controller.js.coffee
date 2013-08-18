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