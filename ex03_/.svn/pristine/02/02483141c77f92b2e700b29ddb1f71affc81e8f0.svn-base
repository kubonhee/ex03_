/**
 * reply module
 */
console.log("reply module....");

var replyService = (function() { 
	return {
		add: function(reply, callback, error) {
			console.log("reply.add()........");
			
			$.ajax({
				type : "post",
				url : "/replies/new",
				data : JSON.stringify(reply),
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr) {
					if(callback) {
						callback(result);
					}
				},
				error : function(xhr, status, er) {
					if(error) {
						error(er);
					}
				}
			});
		},
		getList: function(param, callback, error) {
			var bno = param.bno;
			var page = param.page || 1;
			var url = "/replies/pages/" + page + "/" + bno;
			
			/*
			$.ajax({
				type : "get",
				url : url,
				dataType : "json", 
				success : function(result) {
					if(callback) {
						callback(result);
					}
				},
				error : function(xhr, status, er) {
					if(error) {
						error(er);
					}
				}
			})
			*/
			
			$.getJSON(url, function(result) {
				if(callback) {
					callback(result);
				}
			}).fail(function(xhr, status, er) {
				if(error) {
					error(er);
				}
			});
		},
		remove: function(rno, callback, error) {
			var url = "/replies/" + rno
			$.ajax({
				type : "delete",
				url : url,
				success : function(result) {
					if(callback) {
						callback(result);
					}
				},
				error : function(xhr, status, er) {
					if(error) {
						error(er);
					}
				}
			})
		},
		update: function(reply, callback, error) {
			var url = "/replies/" + reply.rno
			$.ajax({
				type : "put",
				url : url,
				data : JSON.stringify(reply),
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr) {
					if(callback) {
						callback(result);
					}
				},
				error : function(xhr, status, er) {
					if(error) {
						error(er);
					}
				}
			});
		},
		get: function(rno, callback, error) {
			console.log(rno, callback);
			var url = "/replies/" + rno
			$.getJSON(url, function(result) {
				if(callback) {
					callback(result);
				}
			}).fail(function(xhr, status, er) {
				if(error) {
					error(er);
				}
			});
		},
		displayTime: function(timeValue) {
			//var today = moment(new Date());
			//var dateObj = moment(timeValue);
			// return today.diff(dateObj, 'days') < 1 ? dateObj.format("hh:mm:ss") : dateObj.format("yy/MM/DD")
			return moment(timeValue).fromNow();
		}
	}; 
})(); // reply Service datatype ?  