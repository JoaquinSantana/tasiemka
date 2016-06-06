# @cjsx React.DOM

@Article = React.createClass
  handleViewCount: ->
    $.ajax
      type: "PATCH",
      url: "/view_count",
      data: { id: @props.site.id, article_id: @props.article.id }
      success:(data) ->
        console.log("view article")
        return false
      error:(data) ->
        return false
  showModal: ->
    $(window).trigger('modal.visible', @props.article)
  render: ->
    site_color = @props.site.site_color
    if @props.article.title.length > 50
      title = @props.article.title.substring(0,49) + "..."
    else
      title = @props.article.title
    <div ref="articleref" className="link" onClick={@showModal} onMouseEnter={@handleEnter} onMouseLeave={@handleLeave}>  
      <div className='col-md-12 article_wrapper infinite-list-item'> 
        <div className='pull-left article_num' style={{background: site_color}}>
          { @props.position }
        </div>
        <div className='pull-left article_title' id='title_text'>
          { @props.article.title }
        </div>
      </div>
    </div>
