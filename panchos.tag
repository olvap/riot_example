<pancho>
  <div>
    Nombre
    <input name="nombre">
    <br>
    Salsas
    <div each={salsa, i in salsas}>
      <input
        type="checkbox"
        name={'salsa' + index}
        value={salsa}> {salsa}
    </div>
  </div>
  <script>
    this.salsas = opts.salsas
    this.id = opts.id
  </script>
</pancho>
