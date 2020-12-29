window.addEventListener("DOMContentLoaded", ()=>{
  // 現在ページのURLのパス名を取得
  const path = location.pathname
  // パラメーターの値をパスから取得
  const params = path.replace(/problems/g, '').replace(/\//g, '');

  // 心理テストのパス
  const path_problems = "problems"
  // 0以上の整数のみ（ゼロ埋めなし）
  const paramsRegex = /^([1-9]\d*|0)$/

  // 心理テスト画面の場合
  if(path.includes(path_problems) && paramsRegex.test(params)) {
    // 賢者ボタン
    const kenjaBtn = document.getElementById("kenja-btn");
    kenjaBtn.addEventListener("click", (e) => { 
      // フォーム送信処理をキャンセル
      e.preventDefault();
    });

    // 最新ボタン
    const newBtn = document.getElementById("new-btn");
    if(newBtn) {
      newBtn.addEventListener("click", (e) => { 
        // フォーム送信処理をキャンセル
        e.preventDefault();
      });
    }

    // 自己ベストボタン
    const bestBtn = document.getElementById("best-btn");
    if(bestBtn) {
      bestBtn.addEventListener("click", (e) => { 
        // フォーム送信処理をキャンセル
        e.preventDefault();
      });
    }
  }
});