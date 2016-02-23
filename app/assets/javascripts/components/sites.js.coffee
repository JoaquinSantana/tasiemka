@Sites = React.createClass
  getInitialState: ->
    sites: @props.sites
    categories: @props.categories
    videosite: @props.videosite
    all_site: @props.all_site
    all_categories: @props.all_categories
    styles: { "layout": "2-kol" }
  componentDidMount: ->
    rootNode = React.findDOMNode(this)

    $(rootNode).find('.ui.sidebar').sidebar({
       context: $(rootNode)
    })

    $('#close_sidebar').click (e) ->
      e.stopPropagation()
      $('.ui.sidebar').sidebar('toggle')
  getDefaultState: ->
    sites: []
    styles: { "layout": "2-kol" }
  changeLayout: (e) ->
    @setState styles: { "layout": e }
    console.log("Zmiana layoutu na:" + e)
  showModal: ->
    $(window).trigger('modal.visible')
  render: ->
    active1 = <Active /> if @state.styles.layout == '1-kol'
    active2 = <Active /> if @state.styles.layout == '2-kol'
    active3 = <Active /> if @state.styles.layout == '3-kol'
      
    <div className='front_site' style={{"color": "red"}}>
      <div className="ui sidebar right inverted vertical menu">
        <div className="row ui large menu inverted hidden_menu">
          
            <div className="col-md-12">
              <div className='row'>
                <div className="col-md-12 clearfix">
                  <i id='close_sidebar' className="fa fa-times pull-left"></i> 
                  <h1 className="navbar_logo text-center">Tasiemka</h1>
                </div>
              </div>
              <div className="layoutlist list-unstyled">
                <li className="text-center" onClick={@changeLayout.bind(this, '1-kol')}>
                  <h2>Layout</h2>
                  <i className="fa fa-align-justify">{active1}</i>
                </li>
                <li className="text-center" onClick={@changeLayout.bind(this, '2-kol')}>
                  <i className="fa fa-th-list">{active2}</i>
                </li>
                <li className="text-center" onClick={@changeLayout.bind(this, '3-kol')}>
                  <i className="fa fa-th">{ active3 }</i>
                </li>
                <li className="text-center facebook_like">
                  <div className="fb-like" data-href="https://www.facebook.com/tasiemka.info" data-layout="box_count" data-action="like" data-show-faces="true" data-share="false"></div>
                </li>
              </div>
            </div>
          
        </div>
      </div>
      <div className="pusher" style={{"background": "white"}}>
        <Navbar />
        <NewsletterPage />
        <div className="sites_wrapper">
          { 
            if @state.styles.layout == '1-kol'
              <GaleryCategory id={@state.categories[0].id} layout={@state.styles.layout} category={@state.categories[0]} articles={@state.categories[0].articles} all_categories={@props.all_categories} />
            else if @state.styles.layout == '2-kol'
              first_site = @state.sites[0]
              galery_site = @state.sites[0]
              galery_category = @state.categories[0]
              <div key={first_site.id} className="twoColumns">
                <Site id={first_site.id} site={first_site} articles={first_site.articles} all_site={@props.all_site} />
                <GaleryCategory id={galery_category.id} category={galery_category} articles={galery_category.articles} all_categories={@props.all_categories} />
              </div>
            else if @state.styles.layout == '3-kol'
              for site in @state.sites     
                <div key={site.id} className="threColumns">
                  <Site id={site.id} site={site} articles={site.articles} all_site={@props.all_site} />
                </div>
            else
              <h1>Merry Christmas</h1>
          }
        </div>
      </div>
    </div>
