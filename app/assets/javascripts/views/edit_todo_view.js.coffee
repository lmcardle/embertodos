EmberTodos.EditTodoView = Ember.TextField.extend
  classNames: ['edit']

  insertNewLine: ->
    @get('controller').acceptChanges()

  focusOut: ->
    @get('controller').acceptChanges()

  didInsertElement: ->
    @$().focus()