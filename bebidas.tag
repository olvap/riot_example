<bebidas>
  <div each={bebida, i in bebidas}>
    <input
      type="radio"
      name={'bebida' + index}
      value={bebida}> {bebida}
  </div>

  <script>
    this.bebidas = opts.bebidas
    this.id = opts.id
  </script>
</bebidas>
