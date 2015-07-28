@Site = React.createClass
  getInitialState: ->
    articles: @props.site.articles
  getDefaultState: ->
    articles: []
  allSite: ->
    @props.all_site.map (site) =>
      [site.id, site.name]
  changeSite: (site) ->
    #Load site articles from server
    $.ajax
      method: 'GET'
      url: "sites/" + site
      dataType: 'JSON'
      data: site
      success: (data) =>
      #Displat new articles
        @setState articles: data.articles 
  render: ->
    React.DOM.div
      className: 'site_wrapper'
      React.DOM.h2, null, @props.site.name
      React.createElement SiteForm, options: @allSite(), siteName: @props.site.name, handleChangeSite: @changeSite
      React.DOM.ul
        className: 'list-unstyled'
        for article in @state.articles
          React.createElement Article, key: article.id, article: article