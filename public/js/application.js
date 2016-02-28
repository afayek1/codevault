$(document).ready(function() {
  $(".comment-form").on("submit", function(e) {
    e.preventDefault();
    var data = $(this).serialize();
    var request = $.ajax({
      url: this.action,
      method: 'post',
      data: data,
      dataType: 'json'
    });

    request.done(function(data) {
      var commentTemplate = $('#comment-template').html();
      var _template = _.template(commentTemplate);
      var _html = _template({content: data["content"]});
      var commentContainer = document.getElementsByClassName('comments')[0];
      var commentDiv = document.createElement('div');
      commentDiv.innerHTML = _html;
      commentContainer.insertBefore(commentDiv, commentContainer.firstChild);
    });
  })

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
});


