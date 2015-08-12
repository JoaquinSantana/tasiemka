@Sites = React.createClass
  getInitialState: ->
    sites: @props.sites
    all_site: @props.all_site
  getDefaultState: ->
    sites: []
  render: ->
    console.log 'Render Sites'
    React.DOM.div
      className: 'sites_wrapper'
      for site in @state.sites       
        console.log site
        <div key={site.id} className="LOLOLO">
          <Site id={site.id} site={site} articles={site.articles} all_site={@props.all_site} />
        </div>