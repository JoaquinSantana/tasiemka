@Navbar = React.createClass
  render: ->
    facebook_link = <div className="item text-center">
            <i className="facebook icon"></i>
          </div>
    <div className="ui large menu">
      <img className="logo" src="tasiemka2.png" alt="test" />
      <div className="right menu">
        <div className="item text-center">
          <a href="about">
            <i className="info icon"></i>
          </a>
        </div>
        <div className="item" id='knefel'>
          <i className="sidebar icon"></i>
        </div>
      </div>
    </div>


