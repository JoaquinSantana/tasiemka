# @cjsx React.DOM

@Article = React.createClass
  handleEnter: (e) ->
    b = this.refs.articleref.getDOMNode()
    $(b).find('.article_num').transition('pulse')
  handleLeave: (e) ->
    b = this.refs.articleref.getDOMNode()
    $(b).find('.article_num').css("background", @props.site.site_color)
  render: ->
    site_color = @props.site.site_color
    if @props.article.title.length > 50
      title = @props.article.title.substring(0,49) + "..."
    else
      title = @props.article.title
    if @props.site.name == 'Kozaczek'  
      article_link = 'http://kozaczek.pl/' + @props.article.article_url
    else if @props.site.name == 'GwiazdyWP' && @props.article.article_url.substring(0,1) == '/'
      console.log(@props.article.article_url)
      article_link = 'http://gwiazdy.wp.pl' + @props.article.article_url
    else
      article_link = @props.article.article_url
    <a target="_blank" ref="articleref" href="#{article_link}" className="link" onMouseEnter={@handleEnter} onMouseLeave={@handleLeave}>  
      <div className='col-md-12 article_wrapper infinite-list-item'> 
        <div className='pull-left article_num' style={{background: site_color}}>
          { @props.position }
        </div>
        <div className='pull-left article_title'>
          { title }
        </div>
      </div>
    </a>
