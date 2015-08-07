ReactCSSTransitionGroup = React.addons.CSSTransitionGroup
@Site = React.createClass
  getInitialState: ->
    articles: @props.site.articles
    isInfiniteLoading: false
    newArticles: []
  getDefaultState: ->
    articles: []
  allSite: ->
    @props.all_site.map (site) =>
      [site.id, site.name]
  changeSite: (site) ->
    console.log 'change Site'
    #Load site articles from server
    $.ajax
      method: 'GET'
      url: "sites/" + site
      dataType: 'JSON'
      data: site
      success: (data) =>
      #Displat new articles
        @setState articles: data.articles 
        console.log 'success get articles change'
  position: (article) ->
    position = @state.articles.indexOf(article) + 1;
  downloadArticles: ->
    lastarticle = @state.articles[@state.articles - 1]
    $.ajax
      method: 'GET'
      url: "get_articles/" + @props.site.id
      lastElem: lastArticle
      success: (data) =>
        @setState newArticles: data
  handleInfiniteLoad: ->
    @setState isInfiniteLoading: true
    setTimeout (->
      elemLength = that.state.articles.length
      newElements = @state.newArticles
      that.setState
        isInfiniteLoading: false
        articles: @state.articles.concat(newElements)
      return
    ), 2505
  elementInfiniteLoad: ->
    React.DOM.div
      className: 'infinite-list-item'
      'Loading...'
  render: ->
    console.log 'Render Site' + @props.site.name
    '<Infinite elementHeight={40}
                     containerHeight={console.log(250)}
                     infiniteLoadBeginBottomOffset={200}
                     onInfiniteLoad={this.handleInfiniteLoad}
                     loadingSpinnerDelegate={this.elementInfiniteLoad()}
                     isInfiniteLoading={this.state.isInfiniteLoading}
                     >
        {"HEllo"}
    </Infinite>'
    React.DOM.div
      className: 'col-md-4 text-center sites site_wrapper'
      React.createElement SiteForm, options: @allSite(), siteName: @props.site.name, handleChangeSite: @changeSite    