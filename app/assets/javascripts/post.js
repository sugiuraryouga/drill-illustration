$(function(){
if($('#canvas').length){
var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');

// 変数宣言
const cnvWidth = 900;
const cnvHeight = 500;
var cnvColor = "255, 0, 0, 1";  // 線の色
var cnvBold = 5;  // 線の太さ
var clickFlg = 0;  // クリック中の判定 1:クリック開始 2:クリック中
var bgColor = "rgb(255,255,255)";
// 最初の色は上記のように白に指定して白色のキャンバスを作る、その後塗る色を指定して白を上から塗ることで絵をかける

// canvasの背景色を設定(指定がない場合にjpeg保存すると背景が黒になる)
setBgColor();

// canvas上でのイベント

$("#canvas").mousedown(function(){
  clickFlg = 1; // マウス押下開始
}).mouseup(function(){
  clickFlg = 0; // マウス押下終了
}).mousemove(function(e){
  // マウス移動処理
  if(!clickFlg) return false;
  draw(e.offsetX, e.offsetY);
});

// 描画処理
function draw(x, y) {
  ctx.lineWidth = cnvBold;
  ctx.strokeStyle = 'rgba('+cnvColor+')';
  // 初回処理の判定
  if (clickFlg == "1") {
    clickFlg = "2";
    // 押した後elseの処理にするため
    ctx.beginPath();
  // 前のパスを空にする
    ctx.lineCap = "round";  //　線を角丸にする
    ctx.moveTo(x, y);
    // 開始地点を(e.offsetX, e.offsetY)に設定
  } else {
    ctx.lineTo(x, y);
    // 直前の座標と指定座標を結ぶ直線を引く
  }
  ctx.stroke();
  // 線を描く
};

// 色の変更
$(".color a").click(function(){
  cnvColor = $(this).data("color");
  return false;
});

// 線の太さ変更
$(".bold a").click(function(){
  cnvBold = $(this).data("bold");
  return false;
});

// 描画クリア
$("#clear").click(function(){
  ctx.clearRect(0,0,cnvWidth,cnvHeight);
  setBgColor();
});

$("#eraser-button").click(function(){
  cnvColor = $(this).data("color");
  return false;
});

// canvasを画像で保存
$("#download").click(function(){
  canvas = document.getElementById('canvas');
  var base64 = canvas.toDataURL("image/jpeg");
  document.getElementById("download").href = base64;
});

function setBgColor(){
  // canvasの背景色を設定(指定がない場合にjpeg保存すると背景が黒になる)
  ctx.fillStyle = bgColor;
  ctx.fillRect(0,0,cnvWidth,cnvHeight);
  // canvas背景の塗り潰し
};
}
})
