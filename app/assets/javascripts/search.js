$(function() {
  $("#post_search").on("keyup", function() {
  
    var input = $("#post_search").val();
    $.ajax({
      type: 'GET',
      url: '/posts/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(posts) {
      if (posts.length !== 0) {
      
        const data = posts.map(obj => obj.title);
        console.log(data)
        $('#post_search').autocomplete({
          autoFocus: true,
    　　　　source: data,
    　　　　minLength: 1,
          
       
        });
      }

    })
  });
  // var posts=['RON','RUN']
  // $('#post_search').autocomplete({
  //   autoFocus: true,
  //   source: posts,
  //   minLength: 1,
 
  // });

});

