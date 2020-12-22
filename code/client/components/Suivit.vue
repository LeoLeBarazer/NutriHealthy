<template>
    <div id ="suivit">
        <p>Ajoutez une demi journée (avec une activité sportive et un repas) ou créez votre popre activité sportive ou repas.</p>
        <router-link class="link"  to='/asport'>Ajoutez votre sport préférer</router-link>
        <router-link class="link"  to='/arepas'>Ajoutez votre nouriture préférer</router-link>
        <form @submit.prevent="AddDemiJ">
            <select name="activite" id="activite" v-model="newDemiJ.activite">
                <option value="">Saisir le nom de votre activite</option>
                <option v-for="sport in sports" :key="sport.id">
                    {{sport.activite}}
                </option>
            </select>
            <select name="temps" id="temps" v-model="newDemiJ.temps">
                <option value="">Combien de temps avez vous fait cette activité ? (en heure)</option>
                <option v-for="sport in sports" :key="sport.id">
                    {{sport.temps}}h
                </option>
            </select>
        </form>
        <form>
            <select name="type" id="type" v-model="newDemiJ.type">
                <option value="">Qu'avez vous mangé ?</option>
                <option v-for="nourriture in nourritures" :key="nourriture.id">
                    {{nourriture.ingredient}}
                </option>
            </select>
             <select name="quantite" id="quantite" v-model="newDemiJ.quantite">
                <option value="">Qu'avez vous mangé ?</option>
                <option v-for="nourriture in nourritures" :key="nourriture.id">
                    {{nourriture.quantite}}
                </option>
            </select>
        </form>
        <button class="button1" type="submit" @click="AddDemiJ()">Ajouter</button>
    </div>
</template>

<script>
module.exports = {
  props: {
      sports: {type: Array, default: []},
      nourritures: {type: Array, default: []},
      demiJ: {type: Array, default: [[]]},
  },
  data() {
      return {
          newDemiJ:{
              activite: "",
              temps: "",
              type: "",
              quantite: ""
          },
      };
  },
  methods: {
      AddDemiJ(){
          /*this.newDemiJ.activite=this.newDemiJ.activite
          this.newDemiJ.temps=this.newDemiJ.temps
          this.$emit("add-demiJ", this.newSport);*/
          console.log(this.sports);
          console.log(this.nourritures);
      },
  },
};

</script>