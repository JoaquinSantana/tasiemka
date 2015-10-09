@NewsletterPage = React.createClass
  getInitialState: ->
    visible: false
  componentDidMount: ->
    self = this
    $(window).on 'modal.visible', (e) -> 
      self.setState({visible: true})

    $(window).on 'modal.hidden', (e) -> 
      self.setState(self.getInitialState())
  handleClick: (e) ->
    if e.target == this.getDOMNode()
      $(window).trigger('modal.hidden')
  render: ->
    if @state.visible
      modal_classes = 'ui dimmer modals page transition visible active'
    else
      modal_classes = 'ui dimmer modals page transition hidden'
    <div className={modal_classes} onClick={@handleClick}>
      <HelloModal />
    </div>