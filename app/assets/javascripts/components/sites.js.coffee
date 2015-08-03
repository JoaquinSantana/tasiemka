@Sites = React.createClass
  getInitialState: ->
    sites: @props.data
    all_site: @props.all_site
  getDefaultState: ->
    sites: []
  render: ->
    React.DOM.div
      className: 'sites_wrapper'
      for site in @state.sites       
        React.DOM.div
          className: 'col-md-4 text-center sites'
          React.createElement Site, key: site.id, site: site, articles: site.articles, all_site: @state.all_site
