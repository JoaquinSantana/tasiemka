@HelloModal = React.createClass
  getInitialState: ->
    visible: false
    isSubscribe: false
    email: ''
    msg: ''
    validtext: false
    ytmodal: false
    article: {}
  componentDidUpdate: ->
    console.log("FIRED YT MODAL EMBED")
    $('.content .ui.embed').embed();
  componentDidMount: ->
    #$('.ui.modal').modal({detachable: false}).modal('setting', 'transition', "horizontal flip");
    self = this
    $(window).on 'modal.visible', (e, article) ->
      self.setState({visible: true})
      if article
        self.setState({ytmodal: true})
        self.setState({article: article})
    console.log(@state.ytmodal)
    $(window).on 'modal.hidden', (e) ->
      self.setState(self.getInitialState())
  handleSubmit: (e) ->
    e.preventDefault()
    if @state.msg.length < 10
      @setState validtext: true
    else
      data = 
        email: React.findDOMNode(@refs.email).value
        topic: React.findDOMNode(@refs.topic).value
        wiadomosc: React.findDOMNode(@refs.wiadomosc).value
        subscribe: @state.isSubscribe

      $.post 'contacts', { contact: data }, (data) =>
        @showMessage()
        @setState @hideModal
      , 'JSON'
  handleTextChange: (e) ->
    @setState msg: e.target.value
    if @state.msg.length < 10
      @setState validtext: true
    else
      @setState validtext: false
  validEmail: (email) ->
    re = /\S+@\S+\.\S+/
    if re.test(email) == false
      return false
    else
      return true
  showMessage: ->
    $(window).trigger('thanks')
  hideModal: (e) ->
    $(window).trigger('modal.hidden')
  handleSubscribe: (e) ->
    @setState isSubscribe: !@state.isSubscribe
  handleEmail: (e) ->
    @setState email: e.target.value
  render: ->
    if @state.ytmodal
      console.log(@state.article)
      if @state.visible
        modal_classes = 'ui small basic modal transition visible active'
      else
        modal_classes = 'ui small basic modal transition hidden'
      <div className={modal_classes}>
        <div className="ui center aligned header">
          <i className="close icon" onClick={@hideModal}></i>
        </div>
        <div className="content">
          {console.log(@state.article.ytid)}
          {console.log(@state.article.thumbnail_url)}
          <div className="ui embed" data-source="youtube" data-id={@state.article.ytid} data-placeholder={@state.article.thumbnail_url}>
          </div>
        </div>
      </div>
    else
      if @state.visible
        modal_classes = 'ui small modal transition visible active'
      else
        modal_classes = 'ui small modal transition hidden'
      if @state.isSubscribe and !@validEmail(@state.email)
        brakEmail =
          <div className="ui floating message purple invalid">
            <p>Podaj poprawny adres email!</p>
          </div>
        disabeButton = 'disabled'
      if @state.validtext
        brakWiadomosci = 
          <div className="ui floating message purple invalid">
            <p>Napisz do nas parę słów!</p>
          </div>
      <div className={modal_classes}>
        <div className="ui center aligned header">
          Prześlij do nas swoje uwagi
          <i className="close icon" onClick={@hideModal}></i>
        </div>
        <div className="content">
          <form className="ui form" onSubmit={@handleSubmit} remote=true>
            {brakEmail}
            <div className="two fields">
              <div className="field">
                <input name="email" 
                  placeholder="Email (opcjonalnie aby mogliśmy się z Tobą skontaktować)" 
                  type="email"
                  ref="email"
                  value={@state.email} 
                  onChange={@handleEmail}></input>
              </div>
              
              <div className="field">
                <select className="ui fluid dropdown" ref="topic">
                  <option value="pomysl">Pomysł na funkcjonalność</option>
                  <option value="informacja">Informacja o błędzie</option>
                  <option value="opinia">Opinia o stronie</option>
                  <option value="wspolpraca">Współpraca</option>
                </select>
              </div>
            </div>
            {brakWiadomosci}
            <div className="field">
              <textarea value={@state.msg} onChange={@handleTextChange} rows="3" name="wiadomosc" title="Napisz do nas parę słów" ref="wiadomosc"></textarea>
            </div>

            <div className="inline field">
              <div className="ui checkbox">
                <input ref='subscribe' type="checkbox" checked={@state.isSubscribe} onChange={@handleSubscribe}>
                  <label onClick={@handleSubscribe}>Dodaj mnie do listy osób otrzymujących najnowsze informacje o Tasiemce</label>
                </input>
              </div>
            </div>

            <h4 className="ui horizontal divider header">
              <i className="bar envelope icon purple"></i>
            </h4>

            <div className="two fluid ui inverted button #{disabeButton}">
              <input type="submit" value="Wyślij" className="ui btn-block button purple basic" ></input>
            </div>

          </form>
        </div>
      </div>