@Article = React.createClass
  render: ->
    React.DOM.div
      className: 'col-md-12 article_wrapper'
      React.DOM.div
        className: 'pull-right'
        @props.article.title
      React.DOM.div
        className: 'pull-left'
        @props.position
