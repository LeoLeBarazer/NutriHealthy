<template>
  <div id="conversions">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <h1>Conversions</h1>
    <div class="conteneur">
      <div class="volume"><i class="fas fa-balance-scale"></i>
      <p>Conversion d'unités de volume</p>
      <input type="number" v-model="UV" placeholder="0 unité" />
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
      <p>Résultat : {{UniteDeVolume()}}</p>
      </div>
      <div class="masse"><i class="fas fa-utensils"></i>
      <p>Conversion d'unités de masse</p>
      <input type="number" v-model="UM" placeholder="0 unité" />
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
      <p>Résultat : {{UniteDeMasse()}}</p>
      </div>
      <div class="personne"><i class="fas fa-child"></i>
      <p>Conversion pour un nombre de personnes</p>
      <input type="number" v-model="UPV" placeholder="0 unité"/>
      <input type="number" placeholder="X personne" v-model="PV1" />
      <p>pour</p>
      <input type="number" placeholder="X personne" v-model="PV2" />
      <p>Résultat : {{UnitePersonne()}}</p>
      </div>
      <div class="unite-volume"><i class="fas fa-tint"></i>
      <p>Conversion de fractions d'unités de volume</p>
      <input type="number" v-model="UFV1" placeholder="0 unité" />
      <i class="fas fa-divide"></i>
      <input type="number" v-model="UFV2" placeholder="0 unité" />
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
      <p>Résultat : {{FractionDeVolume()}}</p>
      </div>
      <div class="unite-masse"><i class="fas fa-drumstick-bite"></i>
      <p>Conversion de fractions d'unités de masse</p>
      <input type="number" v-model="UFM1" placeholder="0 unité" />
      <i class="fas fa-divide"></i>
      <input type="number" v-model="UFM2" placeholder="0 unité" />
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
      <p>Résultat : {{FractionDeMasse()}}</p>
      </div>
    </div>
  </div>
</template>
<script>
module.exports = {
  data: function () {
    return {
      UV: "",
      V1: "1",
      V2: "1",
      UM: "",
      M1: "1",
      M2: "1",
      UPV: "",
      PV1: "",
      PV2: "",
      UFV1: "",
      UFV2: "",
      FV1: "1",
      FV2: "1",
      UFM1: "",
      UFM2: "",
      FM1: "1",
      FM2: "1"
    }
  },
  methods: {
    UniteDeVolume(){
      let result = this.UV*parseFloat(this.V1)*parseInt(this.V2)
      if (isNaN(result))
        return 0;
      return result;
    },
    UniteDeMasse(){
      let result = this.UM*parseFloat(this.M1)*parseFloat(this.M2)
      if (isNaN(result))
        return 0;
      return result;
    },
    UnitePersonne(){
      let result = this.UPV/this.P1*this.P2
      if (isNaN(result))
        return 0;
      return result;
    },
    FractionDeVolume(){
      let result = this.UFV1/this.UFV2*parseFloat(this.FV1)*parseInt(this.FV2)
      if (isNaN(result))
        return 0;
      return result;
    },
    FractionDeMasse(){
      let result = this.UFM1/this.UFM2*parseFloat(this.FM1)*parseFloat(this.FM2)
      if (isNaN(result))
        return 0;
      return result;
    }
  }
}
</script>