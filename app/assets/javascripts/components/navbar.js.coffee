@Navbar = React.createClass
  getInitialState: ->
    visibleMsg: false
  componentDidMount: ->
    $(".better")
      .typed({
        strings: ["site ^1000", "side ^1000"],
        typeSpeed: 50,
        backDelay: 4000,
        loop: true,
        loopCount: false,
        showCursor: true,
        cursorChar: "|",
      });
    $('.item')
      .popup({
        inline   : true,
        hoverable: true,
        position : 'bottom right',
        inverted: true
      });
    $('#knefel').click (e) ->
      e.stopPropagation()
      $('.ui.sidebar').sidebar('toggle')
    self = this
    $(window).on 'thanks', (e) ->
      text = $('#showmsg')
      text.fadeIn("slow")
      setTimeout ->
          $('#showmsg').fadeOut("slow")
      , 2500 
  showModal: ->
    $(window).trigger('modal.visible')
  render: ->
    newsletter = 
      <div className="item text-center kontakt" onClick={@showModal}>
        <button className="ui blue basic button">Kontakt</button>
      </div>
    top = 
      <div className="item text-center kontakt">
        <button className="ui purple basic button">Ranking</button>
      </div>  
    facebook_link = 
      <div className="item text-center" data-content="Zobacz nasz profil na Facebooku">
        <a href="https://www.facebook.com/tasiemka.info">
          <i className="facebook icon"></i>
        </a>
      </div>
    about =         
      <div className="item text-center" data-content="Przeczytaj więcej o Tasiemce">
        <a href="about">
          <i className="info icon"></i>
        </a>
      </div>
    sidebar = 
      <div className="item" id='knefel' data-content="Ustawienia">
        <button className="ui green basic icon button">
          <i className="sidebar icon"></i>
        </button>
      </div>
    thanksmsg = 
      <div className="ui floating message purple" id='showmsg'>
        <p className="text-center">Twoja wiadomość została wysłana</p>
      </div>
    <div className="ui large menu" id="main_navbar">
      <img className="logo" src="assets/tasiemka2.png" alt="Tasiemka" />
        <div className="item betterMainWrapper">
          <p className="text-center betterMain">Better <span className='better'> </span> <span className="ofInternet">of internet</span></p>
        </div>
      {thanksmsg}
      <div className="right menu">
        {top}
        {newsletter}
        {sidebar}
      </div>
    </div>


