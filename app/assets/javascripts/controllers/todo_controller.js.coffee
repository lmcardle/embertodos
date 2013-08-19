EmberTodos.TodoController = Ember.ObjectController.extend
  isCompleted: ( (key, value) ->
    model = @get 'model'

    if value is undefined
      model.get 'isCompleted'
    else
      model.set 'isCompleted', value
      model.save()
      value
  ).property('model.isCompleted')

  isEditing: false

  editTodo: ->
    @set 'isEditing', true

  acceptChanges: ->
    @set 'isEditing', false
    @get('model').save()