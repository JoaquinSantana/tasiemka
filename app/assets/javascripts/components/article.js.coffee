# @cjsx React.DOM

@Article = React.createClass
  render: ->
    console.log(@props.article.article_url)
    if @props.article.title.length > 60
      title = @props.article.title.substring(0,59) + "..."
    else
      title = @props.article.title
    <a target="_blank" href="#{@props.article.article_url}" className="link">  
      <div className='col-md-12 article_wrapper infinite-list-item'> 
        <div className='pull-left article_num'>
          { @props.position }
        </div>
        <div className='pull-left article_title'>
          { title }
        </div>
      </div>
    </a>
