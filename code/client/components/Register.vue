<template>
    <div id ="login">
        <form @submit.prevent="save">
            <div class="div-connexion">
                <h1>Register</h1>
                <form>
                    <div class="textbox">
                        
                        <div class="text">Vous avez deja un compte ?</div><br/> 
                        <div class="text2">Connectez nous ! </div>
                        
                        <p> E-mail </p>
                        <input class="texte-connexion" type="text" v-model="email" placeholder="Entrez votre e-mail"/>
                        <br/>
                        <p> Password</p>
                        <input class="texte-connexion" type="text" v-model="password" placeholder="Entrez votre mot de passe"/>
                        <br/>
                        <input type="submit" name="" value="Sign up"> 
                        <br/> 
                        <button type="submit_log">Login</button> <br/>
                      
                    </div>
                </form> 
            </div> 
          
        </form>
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
      save(){
          this.$emit("save-user", this.email, this.password);
      },
  },
};

</script>