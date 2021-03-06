// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require react
//= require react_ujs
//= require underscore
//= require semantic-ui
//= require components
//= require typed
//= reqiore custom
//= require_tree .

var APP = {};

Array.prototype.each_slice = function (size, callback){
  for (var i = 0, l = this.length; i < l; i += size){
    callback.call(this, this.slice(i, i + size));
  }
};


var Infinite = require('react-infinite');

var ready;
ready = function() {
  analytics.page();

  $(".better").typed({
    strings: ["site ^1000", "side ^1000"],
    typeSpeed: 50,
    backDelay: 4000,
    loop: true,
    loopCount: false,
    showCursor: true,
    cursorChar: "|",
  });

  $('.basic.button').click(function(){
    var modalwindow = $(this).find('.modal').clone();
    var row = $(this).find('.row');
    $(this).find('.modal').modal('setting', {
      onHide: function () {
        modalwindow.appendTo(row);
      },
      onShow: function () {
        $(this).find('.content .ui.embed').embed();
      }
    }).modal('show');
  });

};

$(document).ready(ready);
$(document).on('page:load', ready);
