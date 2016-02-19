# @cjsx React.DOM

@GaleryCategory = React.createClass
  getInitialState: ->
    articles: @props.category.articles
    all_categories: @props.all_categories
    isInfiniteLoading: false
    newArticles: []
    category: @props.category
    selectedCategory: ''
  allCategories: ->
    allcategories = []
    @state.all_categories.map (category) =>
      allcategories.push [category.id, category.name]
    return allcategories
  changeSite: (site) ->
    console.log(site);
    @setState selectedCategory: ''
    $.ajax
      method: 'GET'
      url: "categories/" + site
      dataType: 'JSON'
      data: site
      success: (data) =>
        #Displat new articles
        @setState articles: data.articles, category: data
    b = React.findDOMNode(@refs.articlesref)
    $(b).transition('pulse') 
    #$('.articles').transition('shake')
  changeCategory: (e) ->
    name = @state.site.name
    category = e
    console.log("zmiana kategorii");
    console.log(e);
    @setState selectedCategory: category
    $.ajax
      method: 'GET'
      url: "categories/" + name
      dataType: 'JSON'
      data: { name, category }
      success: (data) =>
        console.log(data)
        #Display new articles
        @setState articles: data.articles, site: data 
    b = React.findDOMNode(@refs.articlesref)
    $(b).transition('pulse') 
    #$('.articles').transition('shake')
  position: (article) ->
    position = @state.articles.indexOf(article) + 1;
  downloadArticles: ->
    #category = @state.selectedCategory if @state.selectedCategory.length > 0
    category = @state.category
    lastArticle = @state.articles[@state.articles.length - 1]
    console.log(@state.category.id)
    console.log(lastArticle.id)
    $.ajax
      method: 'GET'
      url: "get_articles_from_category/" + @state.category.id
      data: { lastElem: lastArticle.id, act_site: @state.category.id }
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
  sortByName: (a, b) ->
    aName = a.like
    bName = b.like 
    ((aName < bName) ? -1 : ((aName > bName) ? 1 : 0))
  handleSortbyLike: ->
    sortedArticles = _.sortBy(@state.articles, 'like').reverse()
    @setState articles: sortedArticles
  handleSortbyView: ->
    sortedArticles = _.sortBy(@state.articles, 'view').reverse()
    @setState articles: sortedArticles
  render: ->
    if @props.layout && @props.layout == '1-kol'
      klassName = 'col-sm-12 col-sm-12'
    else
      klassName = 'col-sm-8 col-md-8'
    <div className='site', id={@state.category.id}>
      <div className={klassName + ' text-center sites site_wrapper galery_site'}>
        <div className="row">
          <div className="col-md-8">
            <GaleryCategoryForm key={@state.category.id} options={@allCategories()} categoryName={@state.category.name} handleChangeCategorySite={@changeCategory} handleChangeSite={@changeSite} category={@state.category}/>
          </div>
          <div className="col-md-4 pull-right">
            <button onClick={@handleSortbyLike} className="ui red basic icon button"><i className="empty heart icon"></i></button>
            <button onClick={@handleSortbyView} className="ui yellow basic icon button"><i className="empty star icon"></i></button>
          </div>
        </div>
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
                <div className="col-md-3 col-sm-3" key={index} >
                  <GaleryArticle key={index} position={@position(article)} article={article} category={@state.category} />
                </div>
            }
          </Infinite>
        </div>
      </div>
    </div>
