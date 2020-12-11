const pay = () => {
  Payjp.setPublicKey(""); // 公開鍵を環境変数で設定
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order[number]"), // name属性で取得
      cvc: formData.get("order[cvc]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`, // 西暦4桁に書き換える
    };

    // カード情報を Payjp へ送信し token を取得
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `; // hidden属性を付与し token を隠す
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      // カードの情報をフォームから削除
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      // サーバーサイドへ情報を送信
      // (e.preventDefault を設定しているため)
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);