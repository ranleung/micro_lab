
$(document).ready(function(){



	$("#alltags").one('click', function(e){
		e.preventDefault();
		console.log("TEST")
		
		// var compiledTemplate = HandlebarsTemplates['user/index']({data: data});

		// $("#tagData").append(compiledTemplate);

		$.ajax({
			url: "/tags.json",
			type: "GET"
		}).done(function(data){
			console.log(data)

		var array = [];

		for (var i = 0; i < data.length; i++) {
			array.push(data[i].name)
			arr = array.join('  #')
		}
		$("#tagData").append("<h3> #"+arr+"</h3>");
		console.log(arr); 

		// var obs = JSOON.parse('['+s.join(',')+']');

		// var objs = JSON.parse('['+s.join(',')+']');
		}) // ajax close brackets





	}); // on click close brackes

});  // doc close brackets



// $.ajax({
// 	Url: "",
// 	Data: {q: test},
// 	Method: PUT,
// 	Success: function(data){ 
// 	// do stuff with data
// 	}

// })