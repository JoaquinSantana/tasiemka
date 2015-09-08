# @cjsx React.DOM

@GalerySite = React.createClass
  getInitialState: ->
    articles: @props.site.articles
    all_site: @props.all_site
    isInfiniteLoading: false
    newArticles: []
    site: @props.site
  allSite: ->
    @state.all_site.map (site) =>
      [site.id, site.name]
  changeSite: (site) ->
    $.ajax
      method: 'GET'
      url: "sites/" + site
      dataType: 'JSON'
      data: site
      success: (data) =>
        #Displat new articles
        @setState articles: data.articles, site: data
    b = React.findDOMNode(@refs.articlesref)
    $(b).transition('pulse') 
    #$('.articles').transition('shake') 
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
      if newElements.length > 0
        that.setState
          isInfiniteLoading: false
          articles: that.state.articles.concat(newElements)
        return
      else
        that.setState
          isInfiniteLoading: false
        return
    ), 1505
  elementInfiniteLoad: ->
    React.DOM.div
      className: 'infinite-list-item'
      'Pobieranie...'
  showSidebar: ->
    $('.ui.sidebar').sidebar('toggle')
  render: ->
    test = @state.articles.map (article, index) ->
      console.log(article)
    <div className='site', id={@state.site.id}>
      <div className='col-sm-8 col-md-8 text-center sites site_wrapper galery_site'>
        <SiteForm key={@state.site.id} options={@allSite()} siteName={@state.site.name} handleChangeSite={@changeSite} site={@state.site}/>
        <div className='articles' ref='articlesref'>
          <Infinite elementHeight={50}
                           containerHeight={750}
                           infiniteLoadBeginBottomOffset={200}
                           onInfiniteLoad={this.handleInfiniteLoad}
                           loadingSpinnerDelegate={this.elementInfiniteLoad()}
                           isInfiniteLoading={this.state.isInfiniteLoading}
          >
            {
              @state.articles.map (article, index) =>
                <div className="col-md-3 galery_article" key={index}>
                  <GaleryArticle key={index} position={@position(article)} article={article} site={@state.site} />
                </div>
            }
          </Infinite>
        </div>
      </div>
    </div>
###

                  {
                state.articles.each_slice 3, (slice) ->
                  slice.map (article, index) ->
                    console.log article, index
              }###