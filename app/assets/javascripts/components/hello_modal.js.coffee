@HelloModal = React.createClass
  getInitialState: ->
    visible: false
  componentDidMount: ->
    self = this
    
    $(window).on 'modal.visible', (e) ->
      self.setState({visible: true})
  
    $(window).on 'modal.hidden', (e) ->
      self.setState(self.getInitialState())
  handleSubmit: (e) ->
    e.preventDefault()
    console.log("EVENT!!!")
  hideModal: (e) ->
    $(window).trigger('modal.hidden')
  render: ->
    if @state.visible
      modal_classes = 'ui small modal transition visible active'
    else
      modal_classes = 'ui small modal transition hidden'
    <div className={modal_classes}>
      <div className="ui center aligned header">
        Prześlij do nas swoje uwagi
        <i className="close icon" onClick={@hideModal}></i>
      </div>
      <div className="content">
        <form className="ui form" onMouseEnter={@handleSubmit}>

          <h4 className="ui horizontal divider header">
            <i className="bar chart icon"></i>
          </h4>

          <div className="two fields">
            <div className="field">
              <input name="email" placeholder="Email (opcjonalnie aby mogliśmy się z Tobą skontaktować)" type="email" ref="email"></input>
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
            <textarea rows="3" ref="opis"></textarea>
          </div>

          <h4 className="ui horizontal divider header">
            <i className="bar chart icon"></i>
          </h4>

          <div className="two fluid ui inverted buttons">
            <input type="submit" value="Wyślij" className="ui button inverted red" ></input>
          </div>

        </form>
      </div>
    </div>