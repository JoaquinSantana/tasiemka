@SiteForm = React.createClass
  getInitialState: ->
    title: ''
    options: @props.options
    defaultValue: @props.siteName
  getDefaultState: ->
    options: []
  handleChange: (event) ->
    console.log(event.target.value)

    @props.handleChangeSite(event.target.value)
  render: ->
    React.DOM.div
      className: 'siteformwrapper'
      React.DOM.form
        className: 'form-inline'
        React.DOM.select
          onChange: @handleChange
          className: 'select_site'
          defaultValue: @state.defaultValue
          for op in @state.options
            #console.log(op[0])
            React.DOM.option         
              id: op[0]
              className: 'dhdwh'
              op[1]