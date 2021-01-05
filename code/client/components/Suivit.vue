<template>
    <div id ="suivi">
        <p>Ajoutez une demi-journée (avec une activité sportive et un repas) ou créez votre propre activité sportive ou repas.</p>
        <router-link class="link"  to='/asport'>Ajoutez votre sport préféré</router-link>
        <router-link class="link"  to='/arepas'>Ajoutez votre nourriture préférée</router-link>
        <form @submit.prevent="AddDemiJ">
            <select name="activite" id="activite" v-model="newDemiJ.activite" required>
                <option value="">Saisir le nom de votre activité</option>
                <option v-for="sport in sports" :key="sport.id">
                    {{sport.activite}}
                </option>
            </select>
            <select name="temps" id="temps" v-model="newDemiJ.temps" required>
                <option value="">Combien de temps avez vous fait cette activité ? (en heures)</option>
                <option v-for="sport in sports" :key="sport.id">
                    {{sport.temps}}
                </option>
            </select>
            <select name="type" id="type" v-model="newDemiJ.type" required>
                <option value="">Qu'avez vous mangé ?</option>
                <option v-for="nourriture in nourritures" :key="nourriture.id">
                    {{nourriture.ingredient}}
                </option>
            </select>
             <select name="quantite" id="quantite" v-model="newDemiJ.quantite" required>
                <option value="">Qu'avez vous mangé ?</option>
                <option v-for="nourriture in nourritures" :key="nourriture.id">
                    {{nourriture.quantite}}
                </option>
            </select>
        </form>
        <button class="button1" type="submit" @click="AddDemiJ()">Ajouter</button>
        <p>vos activités enregistrées</p>
        {{demiJs}}
        <tr> 
          <td>Activité</td>
          <td>Gain ou perte de calories dans la demi-journée</td>
          <td>Nourriture</td>
        </tr>
        <tr v-for="demiJ in demiJs" :key="demiJ.id">
          <td>{{demiJ}}</td>
          <td>{{demiJ}}</td>
        </tr>-->
    </div>
</template>

<script>
module.exports = {
  props: {
      sports: {type: Array, default: []},
      nourritures: {type: Array, default: []},
      demijs: {type: Array, default: []},
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
          this.newDemiJ.temps=parseInt(this.newDemiJ.temps)
          this.newDemiJ.quantite=parseInt(this.newDemiJ.quantite)
          this.$emit("add-demij", this.newDemiJ);
          console.log('AAAAAAA');
          console.log('BBBBBBB');
          console.log(this.newDemiJ);
      },
  },
};

</script>