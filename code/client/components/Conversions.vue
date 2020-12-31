<template>
  <div id="conversions">
    <h1>Conversions</h1>
    <div>
      <p>Conversion d'unités de volume</p>
      <input type="number" v-model="UV" />
      <select v-model="V1">
        <option value="1">Litres</option>
        <option value="0.1">Décilitres</option>
        <option value="0.01">Centilitres</option>
        <option value="0.001">Millilitres</option>
      </select>
      <i class="fas fa-arrow-right"></i>
      <select v-model="V2">
        <option value="1">Litres</option>
        <option value="10">Décilitres</option>
        <option value="100">Centilitres</option>
        <option value="1000">Millilitres</option>
      </select>
      <br /> 
      <p>Résultat : {{UniteDeVolume()}}</p>
      <br />
      <br />
      <p>Conversion d'unités de masse</p>
      <input type="number" v-model="UM" />
      <select v-model="M1">
        <option value="0.001">Kilogrammes</option>
        <option value="1">Grammes</option>
        <option value="100">Centigrammes</option>
        <option value="1000">Milligrammes</option>
      </select>
      <i class="fas fa-arrow-right"></i>
      <select v-model="M2">
        <option value="1000">Kilogrammes</option>
        <option value="1">Grammes</option>
        <option value="0.01">Centigrammes</option>
        <option value="0.001">Milligrammes</option>
      </select>
      <br /> 
      <p>Résultat : {{UniteDeMasse()}}</p>
      <br />
      <br />
      <p>Conversion pour un nombre de personnes</p>
      <input type="number" v-model="UPV"/>
      <input type="number" placeholder="X personne" v-model="PV1" />
      <p>pour</p>
      <input type="number" placeholder="X personne" v-model="PV2" />
      <br /> 
      <p>Résultat : {{UnitePersonne()}}</p>
      <br />
      <br />
      <p>Conversion de fractions d'unités de volume</p>
      <input type="number" v-model="UFV1" />
      <i class="fas fa-divide"></i>
      <input type="number" v-model="UFV2" />
      <select v-model="FV1">
        <option value="1">Litres</option>
        <option value="0.1">Décilitres</option>
        <option value="0.01">Centilitres</option>
        <option value="0.001">Millilitres</option>
      </select>
      <i class="fas fa-arrow-right"></i>
      <select v-model="FV2">
        <option value="1">Litres</option>
        <option value="10">Décilitres</option>
        <option value="100">Centilitres</option>
        <option value="1000">Millilitres</option>
      </select>
      <br /> 
      <p>Résultat : {{FractionDeVolume()}}</p>
      <br />
      <br />
      <p>Conversion de fractions d'unités de masse</p>
      <input type="number" v-model="UFM1" />
      <i class="fas fa-divide"></i>
      <input type="number" v-model="UFM2" />
      <select v-model="FM1">
        <option value="0.001">Kilogrammes</option>
        <option value="1">Grammes</option>
        <option value="100">Centigrammes</option>
        <option value="1000">Milligrammes</option>
      </select>
      <i class="fas fa-arrow-right"></i>
      <select v-model="FM2">
        <option value="1000">Kilogrammes</option>
        <option value="1">Grammes</option>
        <option value="0.01">Centigrammes</option>
        <option value="0.001">Milligrammes</option>
      </select>
      <br /> 
      <p>Résultat : {{FractionDeMasse()}}</p>
    </div>
  </div>
</template>
<script>
module.exports = {
  data: function () {
    return {
      UV: 0,
      V1: "1",
      V2: "1",
      UM: 0,
      M1: "1",
      M2: "1",
      UPV: 0,
      PV1: "",
      PV2: "",
      UFV1: 0,
      UFV2: 0,
      FV1: "1",
      FV2: "1",
      UFM1: 0,
      UFM2: 0,
      FM1: "1",
      FM2: "1"
    }
  },
  methods: {
    UniteDeVolume(){
      return this.UV*parseFloat(this.V1)*parseInt(this.V2)
    },
    UniteDeMasse(){
      return this.UM*parseFloat(this.M1)*parseFloat(this.M2)
    },
    UnitePersonne(){
      return this.UPV/this.P1*this.P2
    },
    FractionDeVolume(){
      return this.UFV1/this.UFV2*parseFloat(this.FV1)*parseInt(this.FV2)
    },
    FractionDeMasse(){
      return this.UFM1/this.UFM2*parseFloat(this.FM1)*parseFloat(this.FM2)
    }
  }
}
</script>