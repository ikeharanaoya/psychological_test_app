window.addEventListener("DOMContentLoaded", ()=>{
  // 現在ページのURLのパス名を取得
  const path = location.pathname
  // パラメーターの値をパスから取得
  const params = path.replace(/problems/g, '').replace(/\//g, '');

  // 心理テストのパス
  const path_problems = "problems"
  const pathError = "/problems"
  // 0以上の整数のみ（ゼロ埋めなし）
  const paramsRegex = /^([1-9]\d*|0)$/

  // 心理テスト画面の場合
  if((path.includes(path_problems) && paramsRegex.test(params)) || path === pathError) {
    // 賢者ボタン
    const kenjaBtn = document.getElementById("kenja-btn");
    if(kenjaBtn) {
      kenjaBtn.addEventListener("click", (e) => { 
        // フォーム送信処理をキャンセル
        e.preventDefault();
        // 問題のID取得
        const problem_id = document.getElementById("problem_id");
        // XMLHttpRequestを生成
        const XHR = new XMLHttpRequest();
        // XMLHttpRequestを初期化
        XHR.open("GET", `/problems/${problem_id.value}/kenja_search`, true);
        // レスポンスの形式を定義
        XHR.responseType = "json";
        // 送信
        XHR.send();
        // 受信後の処理
        XHR.onload = () => {
          // エラー確認
          if (XHR.status != 200) {
            alert(`Error ${XHR.status}: ${XHR.statusText}`);
            return null
          }

          // 賢者の回答情報を取得
          const answers = XHR.response.post;

          // ラベル情報用の変数
          let radioLabel
          for (let i = 0; i < answers["answers"].length; i++) {
            for (let j = 1; j <= answers["answers"][i]["answer"]; j++) {
              // ラベル情報を取得
              radioLabel = document.getElementById(`${i+1}_${j}`);
              // 印をつける
              radioLabel.style.background = "radial-gradient(ellipse closest-side at 50% 83%,rgb(9 6 148), rgb(220, 242, 253) 90%)"
            }
          }
        };
      });

      // タイトル
      const title = document.getElementById("title");
      if(title) {
        // タイトルクリック時のアクション
        title.addEventListener('click', function() {
          // 賢者ボタンの表示と非表示の設定
          if (kenjaBtn.getAttribute("style") == "display:block;") {
            // 項目を表示する
            kenjaBtn.removeAttribute("style", "display:block;")
          } else {
            // 項目を非表示にする
            kenjaBtn.setAttribute("style", "display:block;")
          }
        });
      }
    }

    // 最新ボタン
    const newBtn = document.getElementById("new-btn");
    if(newBtn) {
      newBtn.addEventListener("click", (e) => { 
        // フォーム送信処理をキャンセル
        e.preventDefault();
        // 問題のID取得
        const problem_id = document.getElementById("problem_id");
        // XMLHttpRequestを生成
        const XHR = new XMLHttpRequest();
        // XMLHttpRequestを初期化
        XHR.open("GET", `/problems/${problem_id.value}/new_search`, true);
        // レスポンスの形式を定義
        XHR.responseType = "json";
        // 送信
        XHR.send();
        // 受信後の処理
        XHR.onload = () => {
          // エラー確認
          if (XHR.status != 200) {
            alert(`Error ${XHR.status}: ${XHR.statusText}`);
            return null
          }

          // 最新の回答情報を取得
          const answers = XHR.response.post;

          // ラベル情報用の変数
          let radioLabel
          for (let i = 0; i < answers.length; i++) {
            for (let j = 1; j <= answers[i]["answer"]; j++) {
              // ラベル情報を取得
              radioLabel = document.getElementById(`${i+1}_${j}`);
              // 印をつける
              radioLabel.style.background = "radial-gradient(ellipse closest-side at 50% 83%,rgb(255 190 0), rgb(220, 242, 253) 90%)"
            }
          }
        }
      });
    }

    // 自己ベストボタン
    const bestBtn = document.getElementById("best-btn");
    if(bestBtn) {
      bestBtn.addEventListener("click", (e) => { 
        // フォーム送信処理をキャンセル
        e.preventDefault();
        // フォーム送信処理をキャンセル
        e.preventDefault();
        // 問題のID取得
        const problem_id = document.getElementById("problem_id");
        // XMLHttpRequestを生成
        const XHR = new XMLHttpRequest();
        // XMLHttpRequestを初期化
        XHR.open("GET", `/problems/${problem_id.value}/best_search`, true);
        // レスポンスの形式を定義
        XHR.responseType = "json";
        // 送信
        XHR.send();
        // 受信後の処理
        XHR.onload = () => {
          // エラー確認
          if (XHR.status != 200) {
            alert(`Error ${XHR.status}: ${XHR.statusText}`);
            return null
          }

          // 自己ベストの回答情報を取得
          const answers = XHR.response.post;

          // ラベル情報用の変数
          let radioLabel
          for (let i = 0; i < answers.length; i++) {
            for (let j = 1; j <= answers[i]["answer"]; j++) {
              // ラベル情報を取得
              radioLabel = document.getElementById(`${i+1}_${j}`);
              // 印をつける
              radioLabel.style.background = "radial-gradient(ellipse closest-side at 50% 83%,rgb(255 2 2), rgb(220, 242, 253) 90%)"
            }
          }
        }
      });
    }
  }
});