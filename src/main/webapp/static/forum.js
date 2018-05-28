(function($){
	var stompClient = null;

	function connect(callback) {
	    var socket = new SockJS(ctx + '/websocket');
	    stompClient = Stomp.over(socket);
	    stompClient.connect({}, callback);
	}

	function disconnect() {
	    if (stompClient !== null) {
	        stompClient.disconnect();
	    }
	    console.log("Disconnected");
	}

	function sendName() {
	    stompClient.send("/app/login", {}, JSON.stringify({'name': '张三'}));
	}

	function showGreeting(message) {
	    alert(message);
	}

	$(function () {
		connect(function (frame) {
	        console.log('Connected: ' + frame);
	        stompClient.subscribe('/message/greetings', function (greeting) {
	            showGreeting(JSON.parse(greeting.body).content);
	        });
	        sendName();
	    });
	});
})(jQuery);