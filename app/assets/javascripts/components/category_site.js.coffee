@CategorySite = React.createClass
  handleChange: (e) ->
    @props.handleChangeCategorySite(e)
  render: ->
    categories = @props.categories.map (category, index) =>
      <button key={index} className="ui inverted button #{category.color}" onClick={@handleChange.bind(this, category.name)}>{category.name}</button>
    <div className="ui pull-right">
      {categories}
    </div>