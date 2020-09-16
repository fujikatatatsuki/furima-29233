function price(){
  // 画面が読み込まれた際にそれぞれの値が入力されるように定義
  const item_price = document.getElementById("item-price"); //販売価格
  const add_tax_price = document.getElementById("add-tax-price"); //販売手数料
  const profit = document.getElementById("profit"); //販売利益
    // 販売価格が入力された際に、手数料・利益を計算する
    item_price.addEventListener('input', () => {
      const value = item_price.value; //入力される金額をinputで定義する

      if (value >= 300 && value <= 9999999){
        let fee = value * 0.1
        let gains = value - fee
        add_tax_price.textContent = fee;
        profit.textContent = gains;
    } else {
      let fee = '0';
      let gains = '0';
      add_tax_price.textContent = fee;
      profit.textContent = gains;
    }
  });

}
window.addEventListener('load', price);