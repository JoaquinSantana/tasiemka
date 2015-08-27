@LogoFavicon = React.createClass
  render: ->
    console.log(@props.link)
    <div>
      <img className='logo_site' src={@props.link}></img>
    </div>