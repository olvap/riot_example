<orden>

  <h3>{ opts.title }</h3>

  <div show={state === 'seleccion'}>
    <seleccion
      items={items}
      cart={cart}
      bebidas={bebidas}
      salsas={salsas}>
    </seleccion>
    <button onclick={goto('formulario')}>Siguiente</button>
  </div>

  <div show={state === 'formulario'}>
    <formulario show={state === 'formulario'}
      cart={cart}
      bebidas={bebidas}
      salsas={salsas}>
    </formulario>
    <button onclick={goto('seleccion')}>Atras</button>
    <button onclick={goto('vuelto')}>Siguiente</button>
  </div>

  <div show={state === 'vuelto'}>
    <vuelto></vuelto>
    <button onclick={goto('formulario')}>Atras</button>
    <button onclick={imprimir}>Siguiente</button>
  </div>

  <script>
    this.items = opts.items
    this.cart = opts.cart
    this.bebidas = opts.bebidas
    this.salsas = opts.salsas

    this.state = 'seleccion'

    goto(state){
      return function(e){
        this.state = state
      }
    }

    imprimir(){
      window.print()
    }
  </script>

</orden>
