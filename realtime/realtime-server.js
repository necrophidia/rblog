var port = 5001;
var io = require('socket.io').listen(port);

console.log("creating a connection");
io.sockets.on( 'connection', function ( socket ) {

	socket.on('new_post', function (msg) {
		console.log('New post created with id = ' + msg);
		socket.broadcast.emit('post_created', msg);
	});

	socket.on('delete_post', function () {
		console.log('A post has been deleted');
		socket.broadcast.emit('post_deleted');
	});

	socket.on('update_post', function () {
		console.log('A post has been updated');
		socket.broadcast.emit('post_updated');
	});

	socket.on('update_like_comment', function () {
		console.log('A post like or comment has been updated');
		socket.broadcast.emit('post_liked_or_commented');
	});

});