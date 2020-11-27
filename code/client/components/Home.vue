<template>
  <div>
    
    <div class="banniere"> 
      <h1 class="titre"> Etre dans son assiette!  </h1>
      <p class="titre2"> Comment trouver le bien etre dans son alimentation?</p> 
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