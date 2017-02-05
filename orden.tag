<orden>

  <h3>{ opts.title }</h3>

  <ul>
    <li each={ items }>
      <button onclick={add({title: title,
                            articulos: articulos,
			    precio: precio})}>{title}</button>
    </li>
  </ul>

  <div>
    total: <strong>{total()}</strong>
  </div>

  <ul>
    <li each={groupedList()}>
      <strong>{qty}</strong><span>{title}</span>
      <button onclick={add({title: title,
                            articulos: articulos,
			    precio: precio})}>+</button>
      <button onclick={remove({title: title})}>-</button>
    </li>
  </ul>

  <form action="" autocomplete="on">
    <div each={item, index in cart}>
      <div each={articulo in item.articulos}>
        <div data-is={ articulo }
	  id={index}
	  salsas={salsas}
	  bebidas={bebidas}>
	</div>
      </div>
    </div>
    <input type="submit">
  </form>

  <script>
    this.items = opts.items
    this.cart = opts.cart
    this.bebidas = opts.bebidas
    this.salsas = opts.salsas

    groupedList(){
      return(
        _.chain(this.cart)
        .groupBy('title')
        .map(function(value, key) {
          return {
           title: key,
           qty: _.pluck(value, 'title').length
          }
        }).value()
      )
    }

    total(){
      return(
        _.reduce(this.cart, function(memo, el){
	  return memo + el.precio  }, 0)
      )
    }
    add(item) {
      return function(e) {
        this.cart.push(item)
      }
    }

    remove(title){
      return function(e){
        var index = _.findIndex(this.cart, function(el){
	  return el.title == title
	})
	this.cart.splice(index, 1)
      }
    }
  </script>

</orden>
