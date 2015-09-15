@Sites = React.createClass
  getInitialState: ->
    sites: @props.sites
    all_site: @props.all_site
  getDefaultState: ->
    sites: []
  render: ->
    <div className='front_site'>
      <Navbar />
      <div className="ui sidebar right inverted vertical menu">
        <div className="ui large menu inverted hidden_menu">
          <div className="ui centered grid">
            <div className="one wide column">
              <h1>Tasiemka</h1>
            </div>
          </div>
        </div>
      </div>
      <div className="pusher">
        <div className="sites_wrapper">
          {
            for site in @state.sites       
              <div key={site.id} className="LOLOLO">
                <Site id={site.id} site={site} articles={site.articles} all_site={@props.all_site} />
              </div>
          }
        </div>
      </div>
    </div>
