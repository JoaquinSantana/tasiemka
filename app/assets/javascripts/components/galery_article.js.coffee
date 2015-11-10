# @cjsx React.DOM

@GaleryArticle = React.createClass
  handleViewCount: ->
    $.ajax
      type: "PATCH",
      url: "/view_count",
      data: { id: @props.site.id, article_id: @props.article.id }
      success:(data) ->
        return false
      error:(data) ->
        return false
  componentDidMount: ->
    $('.heh .ui.embed').embed();
  render: ->
    site_color = @props.site.site_color
    switch @props.site.name 
      when "Michał Sikorski"
        image = @props.article.thumbnail_url
    if @props.article.image
      image = @props.article.image
    if @props.article.title
      title = @props.article.title
    if @props.article.article_url
      switch @props.site.name 
        when "Onet"
          article_url = @props.article.article_url  
        when "Interia"
          article_url = @props.article.article_url  
        when "TVN24"
          if @props.article.article_url.substring(0,4) == 'http'
            article_url = @props.article.article_url
          else
            article_url = 'http://tvn24.pl/' + @props.article.article_url
        when "Pudelek"
          article_url = @props.article.article_url
        when "Kozaczek"
          article_url = 'http://kozaczek.pl/' + @props.article.article_url
        when "GwiazdyWP"
          article_url = 'http://gwiazdy.wp.pl' + @props.article.article_url
        when "Stylowi"
          article_url = 'http://stylowi.pl' + @props.article.article_url
        when "Michał Sikorski"
          article_url = @props.article.thumbnail_url
    switch @props.site.ytchannel
      when true
        console.log("YT CHANNEL LOADED")
        console.log("artikle url to:" + @props.article.thumbnail_url)
        <div className="hehe">
          <a href={@props.article.thumbnail_url}>
            {console.log(@props.article.thumbnail_url)}
            <div className="ui embed" data-source="youtube" data-id={@props.article.ytid} data-icon="right circle arrow" data-placeholder={@props.article.thumbnail_url}>
            </div>
          </a>
        </div>
      when false
        console.log("Other Content loaded")
        <a href={article_url} target="_blank" onClick={@handleViewCount}>
          <figure>
            <img src={image} className="galeryimage" alt="img25"/>
            <figcaption style={{"borderColor": site_color}}>
              <div className="title">{title}</div>
              <div className="icons">
                {
                  if @props.article.lajk
                    <i className="empty heart icon">{@props.article.lajk}</i>  
                }
                {
                  if @props.article.kolekcja
                    <i className="empty star icon">{@props.article.kolekcja}</i>
                }
              </div>
            </figcaption> 
          </figure>
        </a>
        
