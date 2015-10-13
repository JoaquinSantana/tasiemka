@HelloModal = React.createClass
  getInitialState: ->
    visible: false
    isSubscribe: false
    email: ''
  componentDidMount: ->
    self = this
    $(window).on 'modal.visible', (e) ->
      self.setState({visible: true})
  
    $(window).on 'modal.hidden', (e) ->
      self.setState(self.getInitialState())
  handleSubmit: (e) ->
    e.preventDefault()
    data = 
      email: React.findDOMNode(@refs.email).value
      topic: React.findDOMNode(@refs.topic).value
      wiadomosc: React.findDOMNode(@refs.wiadomosc).value
      isSubscribe: @state.isSubscribe

    $.post 'contact', { data: data }, (data) =>
      @setState @getInitialState()
    , 'JSON'
  validEmail: (email) ->
    re = /\S+@\S+\.\S+/
    if re.test(email) == false
      return false
    else
      return true
  hideModal: (e) ->
    $(window).trigger('modal.hidden')
  handleSubscribe: (e) ->
    @setState isSubscribe: !@state.isSubscribe
  handleEmail: (e) ->
    @setState email: e.target.value
  render: ->
    if @state.visible
      modal_classes = 'ui small modal transition visible active'
    else
      modal_classes = 'ui small modal transition hidden'
    if @state.isSubscribe and !@validEmail(@state.email)
      brakEmail =
        <div className="ui floating message purple">
          <p>Podaj poprawny adres email!</p>
        </div>
      disabeButton = 'disabled'
    <div className={modal_classes}>
      <div className="ui center aligned header">
        Prześlij do nas swoje uwagi
        <i className="close icon" onClick={@hideModal}></i>
      </div>
      <div className="content">
        {brakEmail}
        <form className="ui form" onSubmit={@handleSubmit} remote=true>
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
          <div className="field">
            <textarea rows="3" name="wiadomosc" title="Napisz do nas parę słów" ref="wiadomosc"></textarea>
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