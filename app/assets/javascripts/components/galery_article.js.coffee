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
  showModal: ->
    $(window).trigger('modal.visible', @props.article)
  render: ->
    category_color = @props.category.color
    if @props.article.image
      image = @props.article.image
    if @props.article.title
      title = @props.article.title
    <div className="hehe">
      <div onClick={@showModal}>
        <figure>
          <img src={@props.article.thumbnail_url} className="galeryimage" alt="img25"/>
          <figcaption style={{"borderColor": 'red'}}>
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
      </div>
    </div>
