      // კალათის ელემენტების შენახვა
      var cartItems = {};

      // პროდუქტების ჩატვირთვა JSON API-დან
      fetch('products.php')
          .then(response => response.json())
          .then(data => {
              var productList = document.getElementById('productList');
              data.forEach(product => {
                  var productDiv = document.createElement('div');
                  productDiv.className = 'product';
                  productDiv.setAttribute('onclick', `addToCart('${product.name}', '${product.barcode}', '${product.sale_price}')`);
                  productDiv.innerHTML = `<h3> ${product.name} 
                      <span style="color: red;">${product.barcode}</span></h3>
                      |თვითღირებულება: ${product.cost_price} ლარი
                      |გასაყიდი ფასი: ${product.sale_price} ლარი
                      |რაოდენობა: ${product.total_quantity}`;
                  productList.appendChild(productDiv);
              });
          })
          .catch(error => console.error('Error loading products:', error));

function addToCart(name, code, salePrice) {
  // კალათის დივის მოძებნა
  var cart = document.getElementById('cart');
  var emptyMessage = cart.querySelector('.empty-cart');

  // კალათის შეტყობინების წაშლა, თუ ეს ჯერ კიდევ არსებობს
  if (emptyMessage) {
      emptyMessage.remove();
  }

  // პროდუქტის დამატება ან რაოდენობის განახლება
  if (cartItems[code]) {
      // უკვე არსებული პროდუქტის რაოდენობის განახლება
      cartItems[code].quantity++;
      var cartItemElement = document.getElementById('cart-item-' + code);
      cartItemElement.querySelector('.quantity').textContent =  cartItems[code].quantity;
      cartItemElement.querySelector('.total-price').textContent =  Math.round(cartItems[code].quantity * salePrice);
  } else {
      // ახალი პროდუქტის დამატება
      cartItems[code] = { name: name, quantity: 1, salePrice: salePrice };

      var cartItem = document.createElement('div');
      cartItem.className = 'cart-item';
      cartItem.id = 'cart-item-' + code;
      cartItem.innerHTML = `<div class="cart_dasaxeleba">  ${code} - ${name} </div>
          <div class="quantity" style="width:100px; display:flex; justify-content:center;">1</div>
          <div class="total-price">${salePrice} </div> 
          <button class="delete-button" onclick="removeFromCart('${code}')">X</button>`;
      
      cart.appendChild(cartItem);
  }

  // კალათის რაოდენობის განახლება
  updateCartItemCount();
  updateTotalAmount();
}

      function searchProducts() {
  var input = document.getElementById('searchInput').value.toLowerCase();
  var products = document.querySelectorAll('.product');
  
  products.forEach(function(product) {
      var productName = product.querySelector('h3').textContent.toLowerCase();
      var productCode = product.querySelector('span').textContent.toLowerCase();
      
      if (productName.includes(input) || productCode.includes(input)) {
          product.style.display = 'block';
      } else {
          product.style.display = 'none';
      }
  });
}


      function toggleCart() {
          var cartContainer = document.getElementById('cartContainer');
          cartContainer.classList.toggle('active');
      }

      function updateCartItemCount() {
          var itemCount = Object.keys(cartItems).length;
          var cartItemCountElement = document.getElementById('cartItemCount');
          cartItemCountElement.textContent = itemCount;
      }

      // მენიუს გაშლა ჰამბურგერის ღილაკის გამოყენებით
      const menuToggle = document.getElementById('menuToggle');
      const mainMenu = document.getElementById('mainMenu');

      menuToggle.addEventListener('click', () => {
          mainMenu.classList.toggle('show');
      });

      // მოდალის ელემენტები
      var modal = document.getElementById('saleTypeModal');
      var closeButton = document.querySelector('.close-button');
      var checkoutButton = document.getElementById('checkoutButton');
      var confirmSaleTypeButton = document.getElementById('confirmSaleTypeButton');

      // რეალიზაციის ღილაკის დაჭერისას მოდალის გახსნა
      checkoutButton.onclick = function() {
        
          modal.style.display = 'block';
      }

      // მოდალის დახურვა X ღილაკზე დაჭერისას
      closeButton.onclick = function() {
          modal.style.display = 'none';
      }

      
      // გაყიდვის ტიპის დადასტურება
      confirmSaleTypeButton.onclick = function processSale(saleType) {
        var data = {
            sale_type: saleType,
            cart_items: cartItems
        };
    
        // AJAX მოთხოვნა გაყიდვის დასამუშავებლად
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'process_sale.php', true);
        xhr.setRequestHeader('Content-Type', 'application/json');
    
        xhr.onload = function() {
            if (xhr.status === 200) {
                alert('გაყიდვა წარმატებით განხორციელდა!');
                // კალათის გასუფთავება
                cartItems = {};
                var cart = document.getElementById('cart');
                cart.innerHTML = '<p class="empty-cart">კალათი ცარიელია</p>';
                updateCartItemCount();
                updateTotalAmount();
            } else {
                alert('გაყიდვა ვერ შესრულდა: ' + xhr.responseText);
            }
        };
    
        xhr.send(JSON.stringify(data)); // მონაცემების გადაცემა სერვერზე
    }
    

      function processSale(saleType) {
          alert('თქვენ აირჩიეთ ' + saleType + ' გაყიდვა');
          // აქ შეგიძლიათ დაამატოთ AJAX მოთხოვნა ან სხვა ლოგიკა გაყიდვის დასამუშავებლად
      }

      // მოდალის დახურვა ეკრანის ცარიელ ადგილას დაჭერისას
      window.onclick = function(event) {
          if (event.target == modal) {
              modal.style.display = 'none';
          }
      }
     

      function removeFromCart(code) {
  // ამოშლის კალათის ნივთი cartItems ობიექტიდან
  if (cartItems[code]) {
      delete cartItems[code];
      
      // წაშლის კალათიდან შესაბამის HTML ელემენტს
      var cartItemElement = document.getElementById('cart-item-' + code);
      if (cartItemElement) {
          cartItemElement.remove();
      }

      // თუ კალათი ცარიელია, დაამატე შესაბამისი შეტყობინება
      if (Object.keys(cartItems).length === 0) {
          var cart = document.getElementById('cart');
          var emptyMessage = document.createElement('p');
          emptyMessage.className = 'empty-cart';
          emptyMessage.textContent = 'კალათი ცარიელია';
          cart.appendChild(emptyMessage);
      }

      // განაახლე კალათის რაოდენობა
      updateCartItemCount();
      updateTotalAmount();
  }
}

function updateTotalAmount() {
      var total = 0;
      for (var code in cartItems) {
          total += cartItems[code].quantity * cartItems[code].salePrice;
      }
      var totalAmountElement = document.getElementById('checkoutButton');
      if (!totalAmountElement) {
          // თუ ელემენტი არ არსებობს, შევქმნათ
          var checkoutContainer = document.querySelector('.checkout');
          totalAmountElement = document.createElement('p');
          totalAmountElement.id = 'totalAmount';
          checkoutContainer.appendChild(totalAmountElement);
      }
      totalAmountElement.textContent = 'სულ თანხა: ' + total + ' ლარი';
  }
