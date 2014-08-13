require(["hello"], function(hello) {
    // Sorry, IE users :(
    // I just wanted to get something up quick~
    if(!Modernizr.canvas) { 
        window.location.href = "http://www.smashingmagazine.com/2012/07/10/dear-web-user-please-upgrade-your-browser/" 
    } else {
        hello.init();
    }
});
