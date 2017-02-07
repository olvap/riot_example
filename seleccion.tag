<seleccion>
  <style>
    button.menu{
      padding: 20px;
    }
  </style>

  <div class="row">
    <div class="col-md-8">
      <div class="col-md-2" each={ items }>
          <button class="menu" onclick={add(title)}>{title}</button>
      </div>
    </div>
    <div class="col-md-4">
      <div>
        total: <strong>{total()}</strong>
      </div>

      <ul class="list-group">
        <li each={groupedList()} class="list-group-item">
          <span class="badge">{qty}</span>
          {title}
          <button onclick={remove(title)}>-</button>

          <button onclick={add(title)}>+</button>
        </li>
      </ul>
    </div>
  </div>

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
        var item = this.items[index]
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

</seleccion>
