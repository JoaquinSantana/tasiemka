# @cjsx React.DOM

@GalerySite = React.createClass
  getInitialState: ->
    articles: @props.site.articles
    all_site: @props.all_site
    isInfiniteLoading: false
    newArticles: []
    site: @props.site
    selectedCategory: ''
  allSite: ->
    allsite = []
    @state.all_site.map (site) =>
      if site.have_image
        allsite.push [site.id, site.name, site.favurl]
    return allsite
  changeSite: (site) ->
    @setState selectedCategory: ''
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
  changeCategory: (e) ->
    name = @state.site.name
    category = e
    @setState selectedCategory: category
    $.ajax
      method: 'GET'
      url: "sites/" + name
      dataType: 'JSON'
      data: { name, category }
      success: (data) =>
        console.log(data)
        #Displat new articles
        @setState articles: data.articles, site: data 
    b = React.findDOMNode(@refs.articlesref)
    $(b).transition('pulse') 
    #$('.articles').transition('shake')
  position: (article) ->
    position = @state.articles.indexOf(article) + 1;
  downloadArticles: ->
    category = @state.selectedCategory if @state.selectedCategory.length > 0
    lastArticle = @state.articles[@state.articles.length - 1]
    $.ajax
      method: 'GET'
      url: "get_articles/" + @state.site.id
      data: { lastElem: lastArticle.id, act_site: @state.site.id, category }
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
    <div className='site', id={@state.site.id}>
      <div className='col-sm-8 col-md-8 text-center sites site_wrapper galery_site'>
        <GalerySiteForm key={@state.site.id} options={@allSite()} siteName={@state.site.name} handleChangeCategorySite={@changeCategory} handleChangeSite={@changeSite} site={@state.site}/>
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
                if article.category
                  style = {
                    "boxShadow": "0px 0px 5px #{article.category.color}"
                  }
                <div className="col-md-3" key={index} >
                  <GaleryArticle key={index} position={@position(article)} article={article} site={@state.site} />
                </div>
            }
          </Infinite>
        </div>
      </div>
    </div>
