@YtPage = React.createClass
  getInitialState: ->
    visible: false
  componentDidMount: ->
    self = this
    $(self).on 'ytmodal.visible', (e, article) -> 
      self.setState({visible: true})

    $(self).on 'ytmodal.hidden', (e) -> 
      self.setState(self.getInitialState())
  handleClick: (e) ->
    if e.target == this.getDOMNode()
      $(window).trigger('ytmodal.hidden')
  render: ->
    if @state.visible
      modal_classes = 'ui dimmer modals page transition visible active'
    else
      modal_classes = 'ui dimmer modals page transition hidden'
    <div className={modal_classes} onClick={@handleClick}>
      <YtVideoModal article={@props.article}/>
    </div>