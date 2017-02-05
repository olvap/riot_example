<orden>

  <h3>{ opts.title }</h3>

  <div show={state === 'seleccion'}>
    <seleccion
      items={items}
      cart={cart}
      bebidas={bebidas}
      salsas={salsas}>
    </seleccion>
    <button onclick={siguiente}>Siguiente</button>
  </div>

  <div show={state !== 'seleccion'}>
    <formulario show={state !== 'seleccion'}
      cart={cart}
      bebidas={bebidas}
      salsas={salsas}>
    </formulario>
    <button onclick={atras}>Atras</button>
  </div>

  <script>
    this.items = opts.items
    this.cart = opts.cart
    this.bebidas = opts.bebidas
    this.salsas = opts.salsas

    this.state = 'seleccion'

    siguiente(){
      this.state = 'formulario'
    }

    atras(){
      this.state = 'seleccion'
    }

  </script>

</orden>
