@GaleryCategoryForm = React.createClass
  getInitialState: ->
    value: ""
    title: ''
    options: @props.options
    defaultValue: @props.categoryName
    #categories: @props.site.categories
  getDefaultState: ->
    options: []
  componentDidMount: ->
    ###$('.searchheader')
      .popup({
        'reposition',
        inline   : true,
        hoverable: true,
        position : 'right center',
        transition: 'pulse'
      });###

    $('.ui.dropdown')
      .dropdown()
    ;

    $('.ui .dropdown').dropdown(
      onChange: (value) =>
        @props.handleChangeSite(value)
    );
  handleChange: (e) ->
    @props.handleChangeSite(e)
  changeCategory: (e) ->
    @props.handleChangeCategorySite(e)
  render: ->
    category_color = @props.category.color
    categoryname = @props.categoryname
    <div className="row">
      <div className="col-md-12">
        <div className="searchheader ui floating dropdown labeled icon button pull-left" data-content="Wybierz stronę z której chcesz zobaczyć wiadomości">
          <i className="filter icon"></i>
          <span className="text">
            <LogoFavicon />
            {@props.category.name}
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
                      <LogoFavicon />
                      {op[1]}
                    </div>
                  </div>                
              }
            </div>
          </div>
        </div>
      </div>
    </div>
######<CategorySite handleChangeCategorySite={@changeCategory} categories={@state.categories}/>
