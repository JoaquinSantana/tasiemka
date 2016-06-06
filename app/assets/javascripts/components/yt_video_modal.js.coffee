@YtVideoModal = React.createClass
  getInitialState: ->
    visible: false
  componentDidMount: ->
    self = this
    $(window).on 'ytmodal.visible', (e) ->
      self.setState({visible: true})
  
    $(window).on 'ytmodal.hidden', (e) ->
      self.setState(self.getInitialState())

  hideModal: (e) ->
    $(window).trigger('ytmodal.hidden')
  handleSubscribe: (e) ->
    @setState isSubscribe: !@state.isSubscribe
  handleEmail: (e) ->
    @setState email: e.target.value
  render: ->
    if @state.visible
      modal_classes = 'ui small basic modal transition visible active'
    else
      modal_classes = 'ui small basic modal transition hidden'
    <div className={modal_classes}>
      <div className="ui center aligned header">
        Prześlij do nas swoje uwagi
        <i className="close icon" onClick={@hideModal}></i>
      </div>
      <div className="content">
        <div className="ui embed" data-source="vimeo" data-id="125292332" data-placeholder="http://dummyimage.com/600x400/000111/fffced">
        </div>
      </div>
    </div>