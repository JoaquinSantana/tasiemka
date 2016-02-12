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
      <figure>
        <img src={@props.article.thumbnail_url} onClick={@showModal} className="galeryimage" alt="img25"/>
        <figcaption>
          <button className="ui inverted icon button blue">112 <i className="heart icon"></i></button>
          <div className="title">{title}</div>
          <div className="icons">
            <div className="row">
              {
                if @props.article.like
                  <div className="col-md-6 pull-left">
                    <i className="empty heart icon"></i> {@props.article.like}
                  </div>
              }
              {
                if @props.article.view
                  <div className="col-md-6 pull-right">
                    <i className="empty star icon"></i> {@props.article.view}
                  </div>
              }
            </div>
          </div>
        </figcaption> 
      </figure>
    </div>
