// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require rails-ujs
//= require turbolinks
//= require_tree .

const flip = (selector) =>{
    if (selector == "teacher1"){
        $(".card1").toggleClass('is-surface').toggleClass('is-reverse');
    } else if (selector == "teacher2"){
        $(".card2").toggleClass('is-surface').toggleClass('is-reverse');
    } else if (selector == "teacher3"){
        $(".card3").toggleClass('is-surface').toggleClass('is-reverse');
    } else if (selector == "teacher4"){
        $(".card4").toggleClass('is-surface').toggleClass('is-reverse');
    }
};

document.addEventListener("turbolinks:load"
, function () {
   $(function() {
    $('.pro').on('click', (e) =>{
        
      const selector = $(e.target).attr('id');
       
      flip(selector);
    });
  });
  });
  
