<template>
  <div>
    
    <div class="banniere"> 
      <div class="titre"> Etre dans son assiette!  </div>
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