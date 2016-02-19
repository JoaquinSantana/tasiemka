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
  handleVoteUp: ->
    $.ajax
      type: "PATCH",
      url: "/voteup",
      data: { id: @props.article.id }
      success:(data) ->
        console.log("The vote(+) has added")
        return false
      error:(data) ->
        return false
  handleVoteDown: ->
    $.ajax
      type: "PATCH",
      url: "/votedown",
      data: { id: @props.article.id }
      success:(data) ->
        console.log("The vote(-) has added")
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
    <div className="">
      <figure className="effect-duke">
        <img src={@props.article.thumbnail_url} onClick={@showModal} alt="img25"/>
        <figcaption>
          <h3>
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
          </h3>
          <p>
            {title}
            <button onClick={@showModal} className="ui inverted icon button silver">
              <i className="fa fa-play-circle-o"></i>
            </button>
          </p>
        </figcaption> 
      </figure>
    </div>
###<button onClick={@handleVoteUp} className="ui inverted icon button green">
  <i className="fa fa-thumbs-o-up"></i>
</button>
<button onClick={@handleVoteDown} className="ui inverted icon button red">
  <i className="fa fa-thumbs-o-down"></i>
</button>###
