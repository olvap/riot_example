<formulario>

  <form action="" autocomplete="on">
    <div each={item, index in cart}>
      <div each={articulo in item.articulos}>
        <div data-is={ articulo }
	  index={index}
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
  </script>

</formulario>
