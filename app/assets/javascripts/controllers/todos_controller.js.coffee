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

  hasCompleted: ( ->
    if @get('completed') > 0 then true else false
  ).property 'completed'

  completed: ( ->
    @filterProperty('isCompleted', true).get('length')
  ).property('@each.isCompleted')

  clearCompleted: ->
    completed = @filterProperty('isCompleted', true)
    completed.invoke('deleteRecord')
    @get('store').commit()

  allAreDone: ( (key, value) ->
    if value?
      @setEach('isCompleted', value)
      @get('store').save()
      value
    else
      @get('length') && @everyProperty('isCompleted', true)
  ).property('@each.isCompleted')