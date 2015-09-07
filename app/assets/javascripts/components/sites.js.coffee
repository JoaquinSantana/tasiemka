@Sites = React.createClass
  getInitialState: ->
    sites: @props.sites
    all_site: @props.all_site
    styles: {}
  componentDidMount: ->
    rootNode = React.findDOMNode(this)

    $(rootNode).find('.ui.sidebar').sidebar({
       context: $(rootNode)
    })
  getDefaultState: ->
    sites: []
    styles: {}
  changeLayout: (e) ->
    @setState styles: { "color": e }
    console.log("Zmiana koloru na:" + e)
  render: ->
    <div className='front_site' style={{"color": "red"}}>
      <div className="ui sidebar right inverted vertical menu">
        <div className="ui large menu inverted hidden_menu">
          <div className="ui centered grid">
            <div className="one wide column">
              <h1>Tasiemka</h1>
                <li onClick={@changeLayout.bind(this, '3-kol')} style={{"color": "red"}}>Trzy kolumny</li>
                <li onClick={@changeLayout.bind(this, 'bez')} style={{"color": "red"}}>Bez</li>
            </div>
          </div>
        </div>
      </div>
      <div className="pusher" style={{"background": "white"}}>
        <Navbar />
        <div className="sites_wrapper">
          {
            if @state.styles.color == 'bez'
              <h1>Zmieniles layout</h1>
            else if @state.styles.color == '3-kol'
              for site in @state.sites       
                <div key={site.id} className="LOLOLO" style={{"background": "red"}}>
                  <Site id={site.id} site={site} articles={site.articles} all_site={@props.all_site} />
                </div>
            else
              <h1>Merry Christmas</h1>
          }
        </div>
      </div>
    </div>
