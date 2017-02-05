<seleccion>
  <ul>
    <li each={ items }>
      <button onclick={add(title)}>{title}</button>
    </li>
  </ul>

  <div>
    total: <strong>{total()}</strong>
  </div>

  <ul>
    <li each={groupedList()}>
      <strong>{qty}</strong><span>{title}</span>
      <button onclick={add(title)}>+</button>
      <button onclick={remove(title)}>-</button>
    </li>
  </ul>

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
    add(title) {
      return function(e) {
        var index = _.findIndex(this.items, function(el){
	  return el.title == title
	})
        this.cart.push(this.items[index])
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

</seleccion>
