@Article = React.createClass
  render: ->
    React.DOM.li
      className: 'article_wrapper'
      @props.article.title