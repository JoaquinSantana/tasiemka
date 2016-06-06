@HelloModal = React.createClass
  getInitialState: ->
    visible: false
    ytmodal: false
    article: {}
  componentDidUpdate: ->
    console.log("FIRED YT MODAL EMBED")
    $('.content .ui.embed').embed();
  componentDidMount: ->
    #$('.ui.modal').modal({detachable: false}).modal('setting', 'transition', "horizontal flip");
    self = this
    $(window).on 'modal.visible', (e, article) ->
      console.log("E  + ARTICLE")
      console.log(e)
      console.log(article)
      self.setState({visible: true})
      if article
        self.setState({ytmodal: true})
        self.setState({article: article})
    $(window).on 'modal.hidden', (e) ->
      self.setState(self.getInitialState())
  showMessage: ->
    $(window).trigger('thanks')
  hideModal: (e) ->
    $(window).trigger('modal.hidden')
  render: ->
    if @state.article.ytid && @state.article.thumbnail_url
      console.log(@state.article)
      data_id = @state.article.ytid
      data_plh = @state.article.thumbnail_url
      modal = <div className="ui basic modal transition visible active hello">
                    <div className="ui center aligned header">
                      <i className="close icon" onClick={@hideModal}></i>
                    </div>
                    <div className="content">
                      <div className="ui embed" data-source="youtube" data-id={data_id} data-placeholder={data_plh}>
                      </div>
                    </div>
                  </div>
    else
      hidden_modal = <div className='ui basic modal transition hidden hello'>
                      <div className="ui center aligned header">
                        <i className="close icon" onClick={@hideModal}></i>
                      </div>
                      <div className="content">
                      </div>
                    </div>
    if @state.visible
      modal
    else
      hidden_modal
