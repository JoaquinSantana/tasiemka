@Site = React.createClass
  render: ->
    React.DOM.div
      className: 'site_wrapper'
      React.DOM.h2, null, @props.site.name