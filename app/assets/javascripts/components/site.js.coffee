@Site = React.createClass
  getInitialState: ->
    articles: @props.site.articles
  getDefaultState: ->
    articles: []
  position: (article) ->
    position = @props.site.articles.indexOf(article) + 1;
  render: ->
    React.DOM.div
      className: 'site_wrapper'
      React.DOM.h2, null, @props.site.name
#      console.log(@state.articles)
      React.DOM.div
        className: 'row'
        for article in @state.articles
          React.createElement Article, key: article.id, article: article, position: @position(article)
