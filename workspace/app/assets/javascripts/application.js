// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function pickhash(id, postid){
    var hash_id = id;
    var post_id = postid;
  
   $.ajax({
      url: "/brown/pickhash?id="+hash_id+"&postid="+post_id
     
      
    });
            
if (document.getElementsByName(id+"hash")[0].className === "hash-button-small-mango"){
    for(i=0; i<document.getElementsByName(id+"hash").length; i++){
    document.getElementsByName(id+"hash")[i].className = "hash-button-small-melon";
    }
}
else if (document.getElementsByName(id+"hash")[0].className === "hash-button-small"){
    for(i=0; i<document.getElementsByName(id+"hash").length; i++){
    document.getElementsByName(id+"hash")[i].className = "hash-button-small-mango";
    }
}
else if (document.getElementsByName(id+"hash")[0].className === "hash-button-small-melon"){
   for(var i=0; i<document.getElementsByName(id+"hash").length; i++){
    document.getElementsByName(id+"hash")[i].className = "hash-button-small";
    }
}

    
   


}
