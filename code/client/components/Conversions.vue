<template>
  <div id="conversions">
    <h1>Conversions</h1>
    <div>
      <p>Conversion d'unités de volume</p>
      <input type="number" placeholder="1" />
      <select>
        <option value="L">Litres</option>
        <option value="dL">Décilitres</option>
        <option value="cL">Centilitres</option>
        <option value="mL">Millilitres</option>
      </select>
      <i class="fas fa-arrow-right"></i>
      <select>
        <option value="L">Litres</option>
        <option value="dL">Décilitres</option>
        <option value="cL">Centilitres</option>
        <option value="mL">Millilitres</option>
      </select>
      <p>Résultat :</p>
      <br />
      <br />
      <p>Conversion d'unités de masse</p>
      <input type="number" placeholder="1" />
      <select>
        <option value="kg">Kilogrammes</option>
        <option value="g">Grammes</option>
        <option value="cg">Centigrammes</option>
        <option value="mg">Milligrammes</option>
      </select>
      <i class="fas fa-arrow-right"></i>
      <select>
        <option value="kg">Kilogrammes</option>
        <option value="g">Grammes</option>
        <option value="cg">Centigrammes</option>
        <option value="mg">Milligrammes</option>
      </select>
      <p>Résultat :</p>
      <br />
      <br />
      <p>Conversion de volume pour un nombre de personnes</p>
      <input type="number" placeholder="1" />
      <select>
        <option value="L">Litres</option>
        <option value="dL">Décilitres</option>
        <option value="cL">Centilitres</option>
        <option value="mL">Millilitres</option>
      </select>
      <p>pour</p>
      <input type="number" placeholder="X personne" />
      <p>Résultat :</p>
      <br />
      <br />
      <p>Conversion de masse pour un nombre de personnes</p>
      <input type="number" placeholder="1" />
      <select>
        <option value="kg">Kilogrammes</option>
        <option value="g">Grammes</option>
        <option value="cg">Centigrammes</option>
        <option value="mg">Milligrammes</option>
      </select>
      <p>pour</p>
      <input type="number" placeholder="X personne" />
      <p>Résultat :</p>
      <br />
      <br />
      <p>Conversion de fractions d'unités de volume</p>
      <input type="number" placeholder="1/3" />
      <select>
        <option value="L">Litres</option>
        <option value="dL">Décilitres</option>
        <option value="cL">Centilitres</option>
        <option value="mL">Millilitres</option>
      </select>
      <i class="fas fa-arrow-right"></i>
      <select>
        <option value="L">Litres</option>
        <option value="dL">Décilitres</option>
        <option value="cL">Centilitres</option>
        <option value="mL">Millilitres</option>
      </select>
      <p>Résultat :</p>
      <br />
      <br />
      <p>Conversion de fractions d'unités de masse</p>
      <input type="number" placeholder="1/3" />
      <select>
        <option value="kg">Kilogrammes</option>
        <option value="g">Grammes</option>
        <option value="cg">Centigrammes</option>
        <option value="mg">Milligrammes</option>
      </select>
      <i class="fas fa-arrow-right"></i>
      <select>
        <option value="kg">Kilogrammes</option>
        <option value="g">Grammes</option>
        <option value="cg">Centigrammes</option>
        <option value="mg">Milligrammes</option>
      </select>
      <p>Résultat :</p>{{demiJs}}
    </div>
  </div>
</template>
<script>
module.exports = {
  props: {
  },
  data() {
      return {
          email: "",
          password: "",
      };
  },
  methods: {
      log(){
          this.$emit("log-user", this.email, this.password);
      },
  },
};
</script>