BrokenSerializationExampleView = require './broken-serialization-example-view'
{CompositeDisposable} = require 'atom'

module.exports = BrokenSerializationExample =
  brokenSerializationExampleView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    console.log "activating with state,", state
    @brokenSerializationExampleView = new BrokenSerializationExampleView(state.brokenSerializationExampleViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @brokenSerializationExampleView.getElement(), visible: true)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'broken-serialization-example:toggle': => @toggle()

  serialize: ->
    console.log "Seralizing BrokenSerializationExample" # XXX Seems like this is never called?
    brokenSerializationExampleViewState: @brokenSerializationExampleView.serialize()
