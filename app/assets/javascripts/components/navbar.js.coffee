@Navbar = React.createClass
  render: ->
    <div className="ui large menu">
      <img className="logo" src="/assets/tasiemka2.png" alt="test" />
      <div className="right menu">
        <div className="item text-center">
          <i className="info icon"></i>
        </div>
        <div className="item text-center">
          <i className="facebook icon"></i>
        </div>
        <div className="item" id='knefel'>
          <i className="sidebar icon"></i>
        </div>
      </div>
    </div>


