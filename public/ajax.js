// wait for the DOM to be loaded
$(document).ready(function() {

  $('#myForm').ajaxForm({ 
    // target identifies the element(s) to update with the server response 
    target: '#htmlExampleTarget', 

    // success identifies the function to invoke when the server response 
    // has been received; here we apply a fade-in effect to the new content 
    success: function() { 
      $('#htmlExampleTarget').fadeIn('slow'); 
    } 
  });

});


