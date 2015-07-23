@Site = React.createClass
  getInitialState: ->
    articles: @props.site.articles
  getDefaultState: ->
    articles: []
  render: ->
    React.DOM.div
      className: 'site_wrapper'
      React.DOM.h2, null, @props.site.name
#      console.log(@state.articles)
      React.DOM.ul, null, 
        for article in @state.articles
          React.createElement Article, key: article.id, article: article
