


module.exports =
class BrokenSerializationExampleView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('broken-serialization-example')
    @element.innerHTML = """<atom-text-editor tabindex="-1" gutter-hidden style="height: 120px"></atom-text-editor>"""

    # Create message element
    message = document.createElement('div')
    message.textContent = "The BrokenSerializationExample package is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->
    log "serializing BrokenSerializationExampleView"

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element

atom.deserializers.add
  name: 'BrokenSerializationExampleView'
  deserialize: (state) ->
    console.log "deserializing BrokenSerializationExampleView"
    new BrokenSerializationExampleView(state)
