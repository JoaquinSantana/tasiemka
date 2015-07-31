@Article = React.createClass
  render: ->
    React.DOM.div
      className: 'col-md-12 article_wrapper'
      React.DOM.div
        className: 'pull-left article_num'
        @props.position
      React.DOM.div
        className: 'pull-left article_title'
        @props.article.title
