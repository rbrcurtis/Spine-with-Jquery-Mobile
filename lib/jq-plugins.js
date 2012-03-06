(function( $, window, undefined ) {
    $.extend($.mobile, {
        showToast: function(message,delay,callback) {
            var oldMsg = $.mobile.loadingMessage;
            $.mobile.loadingMessage = message;
            $.mobile.showPageLoadingMsg();
            if(!delay)delay = 2000
            setTimeout(function(){
                $.mobile.hidePageLoadingMsg();
                $.mobile.loadingMessage = oldMsg;
                if(callback) callback();
            },delay);
            
        }
    });
})( jQuery, this );