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
    styles: { "layout": "3-kol" }
  changeLayout: (e) ->
    @setState styles: { "layout": e }
    console.log("Zmiana layoutu na:" + e)
  render: ->
    active2 = <Active /> if @state.styles.layout == '2-kol'
    active3 = <Active /> if @state.styles.layout == '3-kol'
      
    <div className='front_site' style={{"color": "red"}}>
      <div className="ui sidebar right inverted vertical menu">
        <div className="row ui large menu inverted hidden_menu">
          
            <div className="col-md-12">
              <h1 className="text-center">Tasiemka</h1>
              <div className="layoutlist list-unstyled">
                <li className="text-center" onClick={@changeLayout.bind(this, '2-kol')}>
                  <h3>Dwie kolumny</h3>
                  <i className="fa fa-th-list">{active2}</i>
                </li>
                <li className="text-center" onClick={@changeLayout.bind(this, '3-kol')}>
                  <h3>Trzy kolumny</h3>
                  <i className="fa fa-th">{ active3 }</i>
                </li>
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
              galery_site = @state.sites[2]
              console.log(@state.sites)
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
