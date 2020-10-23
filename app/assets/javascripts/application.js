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
  
  
  const answer = (answer_key) =>{
    if (answer_key == "1") {
        $(".1").toggleClass('is-surface').toggleClass('is-reverse');
    } else if (answer_key == "2"){
        $(".2").toggleClass('is-surface').toggleClass('is-reverse');
    } else if (answer_key == "3"){
        $(".3").toggleClass('is-surface').toggleClass('is-reverse');
    } else if (answer_key == "4"){
        $(".4").toggleClass('is-surface').toggleClass('is-reverse');
    } else if (answer_key == "5"){
        $(".5").toggleClass('is-surface').toggleClass('is-reverse');
    } else if (answer_key == "6"){
        $(".6").toggleClass('is-surface').toggleClass('is-reverse');
    } else if (answer_key == "7"){
        $(".7").toggleClass('is-surface').toggleClass('is-reverse');
    } else if (answer_key == "8"){
        $(".8").toggleClass('is-surface').toggleClass('is-reverse');
    } else if (answer_key == "9"){
        $(".9").toggleClass('is-surface').toggleClass('is-reverse');
    } else if (answer_key == "10"){
        $(".10").toggleClass('is-surface').toggleClass('is-reverse');
    } 
  };
  
  document.addEventListener("turbolinks:load"
, function () {
   $(function() {
    $('.answer').on('click', (e) =>{
      
      const answer_key = $(e.target).attr('id');
      
      answer(answer_key);
      
      if (answer_key == "1" && $("#1").html() == "答え") {
        $("#1").html("戻る");
      } else if (answer_key == "1" && $("#1").html() == "戻る") {
        $("#1").html("答え");
      } else if (answer_key == "2" && $("#2").html() == "答え") {
        $("#2").html("戻る");
      } else if (answer_key == "2" && $("#2").html() == "戻る") {
        $("#2").html("答え");
      } else if (answer_key == "3" && $("#3").html() == "答え") {
        $("#3").html("戻る");
      } else if (answer_key == "3" && $("#3").html() == "戻る") {
        $("#3").html("答え");
      } else if (answer_key == "4" && $("#4").html() == "答え") {
        $("#4").html("戻る");
      } else if (answer_key == "4" && $("#4").html() == "戻る") {
        $("#4").html("答え");
      } else if (answer_key == "5" && $("#5").html() == "答え") {
        $("#5").html("戻る");
      } else if (answer_key == "5" && $("#5").html() == "戻る") {
        $("#5").html("答え");
      } else if (answer_key == "6" && $("#6").html() == "答え") {
        $("#6").html("戻る");
      } else if (answer_key == "6" && $("#6").html() == "戻る") {
        $("#6").html("答え");
      } else if (answer_key == "7" && $("#7").html() == "答え") {
        $("#7").html("戻る");
      } else if (answer_key == "7" && $("#7").html() == "戻る") {
        $("#7").html("答え");
      } else if (answer_key == "8" && $("#8").html() == "答え") {
        $("#8").html("戻る");
      } else if (answer_key == "8" && $("#8").html() == "戻る") {
        $("#8").html("答え");
      } else if (answer_key == "9" && $("#9").html() == "答え") {
        $("#9").html("戻る");
      } else if (answer_key == "9" && $("#9").html() == "戻る") {
        $("#9").html("答え");
      } else if (answer_key == "10" && $("#10").html() == "答え") {
        $("#10").html("戻る");
      } else if (answer_key == "10" && $("#10").html() == "戻る") {
        $("#10").html("答え");
      }
        
    });
  });
  });
  
  document.addEventListener("turbolinks:load"
, function () {
    $(function (){
      $(".answer").html("答え");
    });
  });
  
  document.addEventListener("turbolinks:load"
, function () {
    $('.reload').on('click', (e) =>{
      document.location.reload();
      $("html,body").animate({scrollTop:0},"300");
    });
  });