<orden>

  <h3>{ opts.title }</h3>

  <ul>
    <li each={ items }>
      <button onclick={add(this)}>{title}</button>
    </li>
  </ul>

  <ul>
    <li each={cart}>
      <strong>{qty}</strong><span>{title}</span>
      <button onclick={add(this)}>+</button>
      <button onclick={remove(this)}>-</button>
    </li>
  </ul>

  <form action="" autocomplete="on">
    <div each={cart}>
      Bebida:
      <input type="radio" name="bebida" value="cola" checked> Cola
      <input type="radio" name="bebida" value="limon"> Limon
      <input type="radio" name="bebida" value="cerveza"> Cerveza
    </div>
    <input type="submit">
  </form>

  <script>
    this.items = opts.items
    this.cart = opts.cart

    remove(item) {
      return function(e) {
        var i = _.findIndex(this.cart, {title: item.title})
        this.cart[i].qty -= 1
        if(this.cart[i].qty === 0){
          this.cart.splice(i,1)
        }
      }
    }

    add(item) {
      return function(e) {
        var selected = this.cart.find(function (product) {
          return product.title === item.title
        })

        if(selected){
          selected.qty += 1
        } else {
          item.qty = 1
          this.cart.push(item)
        }
      }
    }
  </script>

</orden>
