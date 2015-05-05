$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  // $('.edit').on("click", function(e){
  // 	e.preventDefault();
  // })

  $(".add-friend").on("click", function(e){   
    e.preventDefault();    
    var target = e.target
    var id = $(".add-friend").parent().attr("id")
    console.log(id)
    $.ajax({
      url: '/friendships',
      type: 'post',
      data: {friend_id: id}
    }).done(function(){
      console.log(target.innerHTML)
      target.innerHTML = "Unfriend"
    }).fail(function(){
      console.log("fail")
    })
  })

  $("#loginButton").on

  // $(".delete-friend").on("click", function(e){   
  //   e.preventDefault();    
  //   var target = e.target
  //   var id = $(".add-friend").parent().attr("id")
  //   console.log(id)
  //   $.ajax({
  //     url: '/friendships',
  //     type: 'post',
  //     data: {friend_id: id}
  //   }).done(function(){
  //     console.log(target.innerHTML)
  //     target.innerHTML = "Unfriend"
  //   }).fail(function(){
  //     console.log("fail")
  //   })
  // })



});

window.twttr=(function(d,s,id){
  var t,js,fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) {
    return
  }  
  js=d.createElement(s);
  js.id=id;js.src="https://platform.twitter.com/widgets.js";
  fjs.parentNode.insertBefore(js,fjs);
  return window.twttr||(t={_e:[],ready:function(f){t._e.push(f)}})}(document,"script","twitter-wjs")
);







