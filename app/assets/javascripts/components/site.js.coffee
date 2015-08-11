# @cjsx React.DOM

@Site = React.createClass
  getInitialState: ->
    articles: @props.site.articles
    isInfiniteLoading: false
    newArticles: []
  getDefaultState: ->
    articles: @props.site.articles
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
    console.log('download articles')
    lastArticle = @state.articles[@state.articles.length - 1]
    $.ajax
      method: 'GET'
      url: "get_articles/" + @props.site.id
      data: { lastElem: lastArticle.id, act_site: @props.site.id }
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
      className: 'test'
      React.DOM.div
        className: 'col-md-4 text-center sites site_wrapper'
        React.createElement SiteForm, options: @allSite(), siteName: @props.site.name, handleChangeSite: @changeSite
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