# @cjsx React.DOM

@Article = React.createClass
  render: ->
    console.log(@props.site.name)
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
    <a target="_blank" href="#{article_link}" className="link">  
      <div className='col-md-12 article_wrapper infinite-list-item'> 
        <div className='pull-left article_num'>
          { @props.position }
        </div>
        <div className='pull-left article_title'>
          { title }
        </div>
      </div>
    </a>
