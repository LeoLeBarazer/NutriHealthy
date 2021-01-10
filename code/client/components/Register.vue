<template>
    <div id ="login">
        <form @submit.prevent="save">
            <div class="div-connexion">
                <h1>Register</h1>
                <form>
                    <div class="textbox">
                        
                        <p> E-mail </p>
                        <input class="texte-connexion" type="email" v-model="email" placeholder="Entrez votre e-mail"/>
                        <br/>
                        <p> Mot de passe</p>
                        <input class="texte-connexion" type="password" v-model="password" placeholder="Entrez votre mot de passe"/>
                        <br/>
                         
                        <button type="submit" @click="save()">Sign up</button> <br/>
                        <button type="submit" window.location.href = "#/connexion" >Login</button> <br/>
                        <video class="video" fullscreen width="1920" height="1080" loop autoplay muted id=VideoId>
                            <source src="Avocado.mp4" type="video/mp4">
                        </video>
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