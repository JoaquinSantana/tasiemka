@Sites = React.createClass
  getInitialState: ->
    sites: @props.sites
    all_site: @props.all_site
    styles: { "layout": "3-kol" }
  componentDidMount: ->
    rootNode = React.findDOMNode(this)

    $(rootNode).find('.ui.sidebar').sidebar({
       context: $(rootNode)
    })
  getDefaultState: ->
    sites: []
    styles: {}
  changeLayout: (e) ->
    @setState styles: { "layout": e }
    console.log("Zmiana layoutu na:" + e)
  render: ->
    <div className='front_site' style={{"color": "red"}}>
      <div className="ui sidebar right inverted vertical menu">
        <div className="ui large menu inverted hidden_menu">
          <div className="ui centered grid">
            <div className="one wide column">
              <h1>Tasiemka</h1>
                <li onClick={@changeLayout.bind(this, '3-kol')} style={{"color": "red"}}>Trzy kolumny</li>
                <li onClick={@changeLayout.bind(this, '2-kol')} style={{"color": "red"}}>Dwie kolumny</li>
            </div>
          </div>
        </div>
      </div>
      <div className="pusher" style={{"background": "white"}}>
        <Navbar />
        <div className="sites_wrapper">
          { 
            if @state.styles.layout == '2-kol'
              first_site = @state.sites[0]
              galery_site = @state.sites[1]
              <div key={first_site.id} className="LOLOLO">
                <Site id={first_site.id} site={first_site} articles={first_site.articles} all_site={@props.all_site} />   
                <GalerySite id={galery_site.id} site={galery_site} articles={galery_site.articles} all_site={@props.all_site} />
              </div>

            else if @state.styles.layout == '3-kol'
              for site in @state.sites       
                <div key={site.id} className="LOLOLO">
                  <Site id={site.id} site={site} articles={site.articles} all_site={@props.all_site} />
                </div>

            else
              <h1>Merry Christmas</h1>
          }
        </div>
      </div>
    </div>
