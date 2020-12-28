<template>
    <div id ="connexion">
        <div class="center">
            <h1>Login</h1>
            <form method="post">
                <div class="txt_field">
                    <input type="text" required>
                    <span></span>
                    <label> E-mail</label>
                </div>
                <div class="txt_field">
                    <input type="password1" required>
                    <span></span>
                    <label> Mot de passe</label>
                </div>     
                <input type="submit" value="Login">
                
            </form>
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