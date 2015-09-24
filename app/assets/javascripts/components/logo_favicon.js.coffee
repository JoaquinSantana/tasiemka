@LogoFavicon = React.createClass
  render: ->
    <div className="favitem ui label">
      <img className='logo_site' src={@props.link}></img>
    </div>