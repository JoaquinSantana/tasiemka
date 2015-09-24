@SiteForm = React.createClass
  getInitialState: ->
    value: ""
    title: ''
    options: @props.options
    defaultValue: @props.siteName
  getDefaultState: ->
    options: []
  componentDidMount: ->
    $('.ui.dropdown')
      .dropdown()
    ;
    rootNode = React.findDOMNode(this)

    $(rootNode).find('.ui .dropdown').dropdown(
      onChange: (value) =>
        @props.handleChangeSite(value)
    );
  handleChange: (e) ->
    @props.handleChangeSite(e)   
  render: ->
    site_color = @props.site.site_color
    sitename = @props.sitename
    <div className="row">
      <div className="col-md-12">
        <div className="searchheader ui floating dropdown labeled icon button pull-left">
          <i className="filter icon"></i>
          <span className="text">
            <LogoFavicon link={@props.site.favurl} />
            {@props.site.name}
          </span>
          <div className="menu">
            <div className="ui icon search input">
              <i className="search icon"></i>
              <input placeholder="Szukaj witryny..." type="text"></input>
            </div>
            <div className="divider"></div>
            <div className="header">
              <i className="tags icon"></i>
              Witryny
            </div>
            <div className="scrolling menu">
              {
                for op in @state.options
                  <div key={op} onClick={@handleChange.bind(this, op[1])} className="item">
                    <div className="field">
                      <LogoFavicon link={op[2]} />
                      {op[1]}
                    </div>
                  </div>                
              }
            </div>
          </div>
        </div>
      </div>
    </div>
