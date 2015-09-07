RouteHandler = ReactRouter.RouteHandler
Link = ReactRouter.Link

@App = React.createClass
  render: ->
    <div>
      <nav>
        <ul>
          <li>
            <Link to='/'>Sites</Link>
          </li>
          <li>
            <Link to='/about'>About</Link>
          </li>
        </ul>
      </nav>
      <RouteHandler />
    </div>