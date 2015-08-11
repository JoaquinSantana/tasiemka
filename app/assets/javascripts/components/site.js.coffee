# @cjsx React.DOM

@Site = React.createClass
  getInitialState: ->
    articles: @props.site.articles
    all_site: @props.all_site
    isInfiniteLoading: false
    newArticles: []
    site: @props.site
  getDefaultState: ->
    articles: @state.site.articles
  allSite: ->
    @state.all_site.map (site) =>
      [site.id, site.name]
  changeSite: (site) ->
    console.log 'change Site'
    console.log(site)
    $.ajax
      method: 'GET'
      url: "sites/" + site
      dataType: 'JSON'
      data: site
      success: (data) =>
      #Displat new articles
        @setState articles: data.articles, site: data 
        console.log 'success get articles change'
  position: (article) ->
    position = @state.articles.indexOf(article) + 1;
  downloadArticles: ->
    lastArticle = @state.articles[@state.articles.length - 1]
    $.ajax
      method: 'GET'
      url: "get_articles/" + @state.site.id
      data: { lastElem: lastArticle.id, act_site: @state.site.id }
      success: (data) =>
        @setState newArticles: data
  handleInfiniteLoad: ->
    that = this
    @setState isInfiniteLoading: true
    @downloadArticles()
    setTimeout (->
      elemLength = that.state.articles.length
      newElements = that.state.newArticles
      that.setState
        isInfiniteLoading: false
        articles: that.state.articles.concat(newElements)
      return
    ), 2505
  elementInfiniteLoad: ->
    React.DOM.div
      className: 'infinite-list-item'
      'Loading...'
  render: ->
    React.DOM.div
      id: @state.site.id
      className: 'test'
      React.DOM.div
        className: 'col-md-4 text-center sites site_wrapper'
        <SiteForm key={@state.site.id} options={@allSite()} siteName={@state.site.name} handleChangeSite={@changeSite} />
        React.DOM.div
          className: 'articles'
          <Infinite elementHeight={40}
                           containerHeight={756}
                           infiniteLoadBeginBottomOffset={200}
                           onInfiniteLoad={this.handleInfiniteLoad}
                           loadingSpinnerDelegate={this.elementInfiniteLoad()}
                           isInfiniteLoading={this.state.isInfiniteLoading}
          >
            {
              for article in @state.articles
                <Article key={article.id} position={@position(article)} article={article} />
            }
          </Infinite>