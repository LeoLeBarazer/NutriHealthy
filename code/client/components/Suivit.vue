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
        <table cellpadding="15" id="table" class="case">
            <tr> 
                <td>sports</td>
                <td>Votre total de calories</td>
                <td>nourritures</td>
            </tr>
            <!--<tr v-for="ordinateur in ordinateurs" :key="ordinateur.id">
                <td>{{ordinateur.cpu}}</td>
                <td>{{ordinateur.gpu}}</td>
                <td>{{ordinateur.ram}}</td>
                <td>{{ordinateur.refroidissement}}</td>
                <td>{{ordinateur.stockage}}</td>
                <td>{{ordinateur.alimentation}}</td>
            </tr>-->
      </table>
      <button class="button1" @click="Rapport(demijs,sports,nourritures)">Voir un rapport sur sa vie</button>
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
          Rap_sport:{
              nom:[],
              cal:[],
          },
           Rap_nour:{
                nom:[],
                cal:[],
           },
           Rap_cal:{
               Plus:[],
               Moins:[],
               Somme:[],
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

    /*Somme(){
          var i;
          var somme;
            for (i=0; i<Rap_nour.nom.length; i++){
              //console.log(sports[i].activite);
              if (i==0){
                  //console.log("list_sport[0][i] =" + list_sport[0][i]);
                  this.Rap_cal.somme.push("Rapport de calories");
              }
              else{
                  somme = Rap_nour.cal[i] - Rap_sport.cal[i];
                  console.log("i=" + i);
                  Rap_cal.somme.push(somme);
              }
        }
        console.log("Rap_cal.somme = "+ Rap_cal.somme);
     },*/

      Rapport(demijs,sports,nourritures){
          var i;
          var somme;
          var list_sport = new Array (demijs[0].sport);
          var list_nour = new Array (demijs[0].nourriture);
          console.log(demijs);
          
          //this.demijs.sport;
          console.log(list_sport[0]);
          console.log("demijs[0].sport.length = "+ demijs[0].sport.length);
          console.log("sports = "+ sports[4].activite);
          console.log(this.Rap_sport.nom);
          for (i=0; i<demijs[0].sport.length; i++){
              //console.log(sports[i].activite);
              if (list_sport[0][i]==0){
                  console.log("list_sport[0][i] =" + list_sport[0][i]);
                  this.Rap_sport.nom.push("sports");
                  this.Rap_sport.cal.push("cal");

                  this.Rap_nour.nom.push("nourriture");
                  this.Rap_nour.cal.push("cal");

                  this.Rap_cal.Somme.push("Rapport de calories");
              }
              else{
                  console.log("list_sport[0][i] =" + list_sport[0][i]);
                  console.log("sport");
                  this.Rap_sport.nom.push(sports[list_sport[0][i]-1].activite);
                  this.Rap_sport.cal.push(sports[list_sport[0][i]-1].calories);

                  console.log("nourriture");
                  this.Rap_nour.nom.push(nourritures[list_nour[0][i]-1].ingredient);
                  this.Rap_nour.cal.push(nourritures[list_nour[0][i]-1].calories);

                  console.log("cal");
                  somme = this.Rap_nour.cal[i] - this.Rap_sport.cal[i];
                  console.log("somme = " + somme);
                  this.Rap_cal.Somme.push(somme);
                  console.log("i=" + i);
              }
          }
          console.log("sortie:");
          console.log(this.Rap_sport);
          console.log(this.Rap_nour);
          console.log(this.Rap_cal);
          console.log(list_sport);


          //Fonction addline
          for (i=0; i<demijs[0].sport.length; i++){
                var SP = this.Rap_sport.nom[i];
                var NO = this.Rap_nour.nom[i];
                var CA = this.Rap_cal.Somme[i];
                var tableau= document.getElementById('table');
                var newRow= tableau.insertRow(-1);

                var cel1 = newRow.insertCell(0);
                var cel2 = newRow.insertCell(1);
                var cel3 = newRow.insertCell(2);

                  cel1.innerText = SP;
                  cel2.innerText = NO;
                  cel3.innerText = CA;
          }

          //console.log("Rap_cal.somme = "+ Rap_cal.somme);
          //window.Somme();
      },
  }
};

</script>

