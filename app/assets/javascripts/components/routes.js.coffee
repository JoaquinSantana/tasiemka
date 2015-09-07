Route = ReactRouter.Route
DefaultRoute = ReactRouter.DefaultRoute

@MyRoutes = (
  <Route handler={App}>
    <DefaultRoute handler={Sites} />
    <Route handler={About} path='about'/>
  </Route>
)