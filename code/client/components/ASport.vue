<template>
    <div id ="asport">
        <form @submit.prevent="AddSport">
            <div class="div-connexion">
                <p>Ajoutez une activité sportive</p>
                <input class="texte-connexion" type="text" v-model="newSport.activite" placeholder="Entrez le nom de votre activité"/>
                <br/>
                <input class="texte-connexion" type="number" v-model="newSport.temps" placeholder="Combien de temps avez vous pratiqué votre activité ?(en heures)"/>
                <br/>
                <input class="texte-connexion" type="number" v-model="newSport.calories" placeholder="Combien de calories avez vous brulez ?"/>
            </div>
            <br/>
            <div class="div-button">
                <button class="button-connexion" type="submit">Envoyer</button>
            </div>
        </form>
    </div>
</template>

<script>
module.exports = {
  props: {
      sports: {type: Array, default: []},
      nourritures: {type: Array, default: []},
  },
  data() {
      return {
          newSport:{
              activite: "",
              temps: "",
              calories: ""
          },
            newNourritures:{
                ingredient: "",
                quantite: "",
                calories: ""
            },
      };
  },
  methods: {
      AddSport(){
          this.newSport.temps=parseInt(this.newSport.temps)
          this.newSport.calories=parseInt(this.newSport.calories)
          this.$emit("add-sport", this.newSport);
      },
    AddNourritures(){
            this.newNourritures.quantite=parseInt(this.newNourritures.quantite)
          this.newNourritures.calories=parseInt(this.newNourritures.calories)
          this.$emit("add-nourritures", this.newNourritures);
      },
  },
};

</script>