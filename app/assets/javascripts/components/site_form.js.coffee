@SiteForm = React.createClass
  getInitialState: ->
    title: ''
    options: @props.options
    defaultValue: @props.siteName
  getDefaultState: ->
    options: []
  handleChange: (event) ->
    @props.handleChangeSite(event.target.value)   
  render: ->
    <div className="row siteformwrapper">
      <div className="col-md-12">
        <LogoFavicon link={@props.site.favurl} />
        <form className='form-inline pull-left'>
          <select className='select_site' onChange={@handleChange} defaultValue={@state.defaultValue}>
            {
              for op in @state.options
                <option key={op} className='option_select'>{op[1]}</option>
            }
          </select>
        </form>
      </div>
    </div>