window.fbAsyncInit = function() {
  FB.init({appId: FacebookApiId, status: true, cookie: true, xfbml: true});
};
(function() {
   var e = document.createElement('script');
   e.type = 'text/javascript';
   e.src = document.location.protocol +
     '//connect.facebook.net/en_US/all.js';
   e.async = true;
   document.getElementById('fb-root').appendChild(e);
 }());
