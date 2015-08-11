@SiteForm = React.createClass
  getInitialState: ->
    title: ''
    options: @props.options
    defaultValue: @props.siteName
  getDefaultState: ->
    options: []
  handleChange: (event) ->
    console.log 'Render Site Form - handleCHange'
    @props.handleChangeSite(event.target.value)
  render: ->
    console.log 'Render Site Form'
    React.DOM.div
      id: @props.key
      className: 'row siteformwrapper'
      React.DOM.div
        className: 'col-md-12' 
        React.DOM.form
          className: 'form-inline pull-left'  
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