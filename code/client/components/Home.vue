<template>
  <div>
    
    <div class="banniere"> 
      <h1 class="titre">Être dans <br>son assiette !  </h1>
      <p class="titre2"> Comment trouver le bien être dans son alimentation ?</p> 
    </div>


    
  </div>
</template>

<script>
function toggleMute() {

  var video=document.getElementById("videoId");

  if(video.muted){
    video.muted = false;
  } else {
    debugger;
    video.muted = true;
    video.play()
  }

}
</script>

<style scoped>

</style>