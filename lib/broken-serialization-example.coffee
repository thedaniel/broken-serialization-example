BrokenSerializationExampleView = require './broken-serialization-example-view'
{CompositeDisposable} = require 'atom'

module.exports = BrokenSerializationExample =
  brokenSerializationExampleView: null

  activate: (state) ->
    console.log "activating with state,", state
    @brokenSerializationExampleView = new BrokenSerializationExampleView(state.brokenSerializationExampleViewState)
    elt = @brokenSerializationExampleView.getElement()
    console.log elt
    atom.views.getView(atom.workspace).appendChild(elt)

  serialize: ->
    console.log "Seralizing BrokenSerializationExample" # XXX Seems like this is never called?
    brokenSerializationExampleViewState: "doesn't matter"

  deserialize: ->
    console.log "BrokenSerializationExample deserialize"
