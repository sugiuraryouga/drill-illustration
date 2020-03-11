// // // 匿名関数を即時実行
// $(function(){

//   // ------------------------------------------------------------
//   // FormData に対応していない
//   // ------------------------------------------------------------
//   if(!(window.FormData)) return;

//   // ------------------------------------------------------------
//   // フォーム要素を取得する
//   // ------------------------------------------------------------
//   // id 属性が、"my_form" であるエレメントを取得
//   var form = document.getElementById("new_post");

//   // ------------------------------------------------------------
//   // サブミット直前に実行されるイベント
//   // ------------------------------------------------------------
//   $('#new_post').on('submit', function(e){
//     // ------------------------------------------------------------
//     // デフォルトの動作をキャンセル（フォームの送信を中止）
//     // ------------------------------------------------------------
//     e.preventDefault();

//     // ------------------------------------------------------------
//     // FormData オブジェクトを作成する
//     // ------------------------------------------------------------
//     var form_data = new FormData(form);
//     var canvas = document.getElementById('canvas');
//     var base64 = canvas.toDataURL();
//     // 出力テスト
//     form_data.append( "canvas_image" , base64  )
//     console.log(form_data)
//     var url = $(this).attr('action')
//     $.ajax({
//       url: url,
//       type: "POST",
//       data: form_data,
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })
//      .done(function(){
         
//          // $('.form__submit').prop('disabled', false);は、 htmlの仕様でsubmitボタンを一度押したらdisabled属性というボタンが押せなく属性が追加されます。 そのため、disabled属性をfalseにする記述を追加しています
//        })  
//        .fail(function(){
//          alert('error');
//        })
       
//      });

// })