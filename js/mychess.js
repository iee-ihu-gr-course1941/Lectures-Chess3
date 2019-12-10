var me={};
var game_status={};

$(function () {
	draw_empty_board();
	fill_board();
	
	$('#chess_login').click( login_to_game);
	$('#chess_reset').click( reset_board);
		
});


function draw_empty_board() {
	var t='<table id="chess_table">';
	for(var i=8;i>0;i--) {
		t += '<tr>';
		for(var j=1;j<9;j++) {
			t += '<td class="chess_square" id="square_'+j+'_'+i+'">' + j +','+i+'</td>'; 
		}
		t+='</tr>';
	}
	t+='</table>';
	
	$('#chess_board').html(t);
}

function fill_board() {
	$.ajax({url: "chess.php/board/", success: fill_board_by_data });
}
function reset_board() {
	$.ajax({url: "chess.php/board/", method: 'POST',  success: fill_board_by_data });
}
function fill_board_by_data(data) {
	for(var i=0;i<data.length;i++) {
		var o = data[i];
		var id = '#square_'+ o.x +'_' + o.y;
		var c = (o.piece!=null)?o.piece_color + o.piece:'';
		var im = (o.piece!=null)?'<img class="piece" src="images/'+c+'.png">':'';
		$(id).addClass(o.b_color+'_square').html(im);
		
	}
}

function login_to_game() {
	if($('#username').val()=='') {
		alert('You have to set a username');
		return;
	}
	var p_color = $('#pcolor').val();
	$.ajax({url: "chess.php/players/"+p_color, 
			method: 'PUT',
			dataType: "json",
			contentType: 'application/json',
			data: JSON.stringify( {username: $('#username').val(), piece_color: p_color}),
			success: login_result,
			error: login_error});
}

function login_result(data) {
	me = data[0];
	$('#game_initializer').hide();
	update_info();
	game_start();
}

function login_error(data,y,z,c) {
	var x = data.responseJSON;
	alert(x.errormesg);
	
}

function game_start() {
	$.ajax({url: "chess.php/status/", success: update_status });
}

function update_status(data) {
	game_status=data[0];
	update_info();
	if(game_status.p_turn==me.piece_color) {
		x=0;
		// do play
	} else {
		// must wait for something
		setTimeout(function() { game_start();}, 4000);
	}
 	
}

function update_info(){
	$('#game_info').html("I am Player: "+me.piece_color+", my name is "+me.username +'<br>Game state: '+game_status.status+', '+ game_status.p_turn+' must play now.');
	
}