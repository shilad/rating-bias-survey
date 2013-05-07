	// function:
(function( $ ){
	var template = Handlebars.compile($('#template').html()),
		idleTime = 0;
	$(".main-container").append(template(data));



	$(".panel").find("input").on("click", function(e){
		var $this = $(this);
		sendSurveyResponse($this.attr("class"), $this.attr("id"), $this.val());
	})

	$("button.depth.negative, button.depth.positive").on("click",function(){
		var $this = $(this),
			opposite;
		if ($this.hasClass("negative")){
			opposite = $this.parent().find("button.depth.positive");
		} else {
			opposite = $this.parent().find("button.depth.negative");
		}
		$this.addClass("checked");
		opposite.removeClass("checked");
		sendSurveyResponse($this.data("field"), $this.attr("id"), $this.val());
	})

	// console.log($("#beginDiv > button")[1]);

	function pageContentSetup(last){
		var webArtifacts = $(".artifact"),
			pageTracker = $(".pageTracker");
		$('.wikiContent').eq(last).attr('id','wp');
		webArtifacts.each(function(key, val){
			if(key !== last){
				$(val).hide();
			}
		});
		pageTracker.before(pageTracker.clone()).css("width", "100%").addClass("persist");
		$(window).scroll(persistence).trigger("scroll");
	}

	function persistence(){
		var offset         = $(".pageTracker").offset(),
           	scrollTop      = $(window).scrollTop(),
           	floatingHeader = $(".persist");
       	if (scrollTop > offset.top) {
           	floatingHeader.css({
            	"visibility": "visible"
           	});
       	} else {
           	floatingHeader.css({
            	"visibility": "hidden"
           });
       	};
	}

	function addWidgetListeners(){
		console.log('stuff: ');
		var trigger = $("a.trigger"),
			panel = $(".panel");
		trigger.click(function(){
			// console.log("panel open");
			trigger.tooltipster("disable");
			$(this).toggleClass("active");
			if ($(this).hasClass("active")){
				panel.show("fast");
				$(this).animate({
					left: -50
				});
			} else {
				panel.hide("fast");
				$(this).animate({
					left: 0
				})
			}
		});
		panel.hover(function(){
			trigger.fadeTo("fast",0.5);
		}, function(){
			trigger.fadeTo("fast",1.0);
		});
	}

	function addNavListeners(){
		var webArtifacts = $(".artifact");
		webArtifacts.each(function(key, val){
			var previous = $(val).find(".previous"),
				forward = $(val).find(".forward");
			if(key > 0){
				previous.click(function(){
					sendAction("previous");
					previous = $(webArtifacts[key]);
					previous.fadeOut("fast", function(){
						$(this).find(".wikiContent").removeAttr("id","wp");
						$(this).find(".wikiContent").find(".previous .forward").fadeOut();
						var current = $(webArtifacts[key-1]);
						current.fadeIn("fast");

						current.find(".wikiContent").attr("id", "wp");
					});
				});
			} else {
				previous.hide();
			}

			if(key == webArtifacts.size()-1){
				forward.hide();
			} else {
				//add this listener only after tooltipster shows and only after a rate is done
				forward.tooltipster({
					fixedWidth: 300,
					position: 'left',
					interactive: true,
					animation: 'grow',
					trigger:'click'
					// functionReady: function(origin, tooltip){
					// 	origin.on("click", nextArticleHandler);
					// 	// addForwardListener(origin,webArtifacts,key)
					// },
					// functionAfter: function(origin) {
					// 	origin.off("click", nextArticleHandler);
					// }
				});
			}
		});
		$(document).keyup(function(event){
			if (event.which == 37){
				$("div#wp").parents(".artifact").find(".previous").click();
				// $(".previous:visible").click();

			} else if (event.which == 39){
				// $("div#wp").parents(".artifact").find(".forward").click();
				$("div#wp").parents(".artifact").find(".forward").click();

			}
		});
	}
//todo: merge consent forms,

	function sendAction(action){
		var tracker = $(".pageTracker > span"),
			pageNumber = parseInt(tracker.html());
		if (action === "forward"){
			pageNumber += 1;
		} else if (action === "previous"){
			pageNumber -= 1;
		}
		tracker.html(pageNumber);
		$.ajax({
		    url:"user/updateActions",
		    dataType: 'json',
		    data: {
		        button: action,
		        pageNumber: pageNumber,
		        user: $.cookie("user")
		    },
		    success: function(data) {
		    	// console.log(data);
		    },
		    error: function(request, status, error) {
		        console.log(error)
		    },
		    complete: function() {
	    	}
		});

	}

	function nextArticleHandler(){
		sendAction("forward");
		var currentArticle = $(this).parents(".artifact"),
			nextArticle = currentArticle.next();
		console.log($(this).html());
		console.log(currentArticle);
		currentArticle.fadeOut("fast", function(){
			$(this).find(".wikiContent").removeAttr("id","wp");
			nextArticle.fadeIn("fast");
			nextArticle.find(".wikiContent").attr("id", "wp");
		});

	}

	function ratedCheck(artifact, forwardButton){
		var done = true;
		var fieldSets = artifact.find("fieldset").each(function(key, val){
			if ($(val).find('input:radio:checked').length === 0) {
				done = false;
        	}
		});

		if (done === true) {
			artifact.addClass("rated");
			forwardButton.tooltipster('hide').tooltipster('disable');
			forwardButton.off("click").on("click", nextArticleHandler);

		}
	}

	function sendSurveyResponse(input, domId, value){
		$.ajax({
		    url:"response/updateResponses",
		    dataType: 'json',
		    data: {
		    	id: input,
		    	ratingValue: value,
		    	userId: $.cookie("user"),
		    	domId: domId
		    },
		    success: function(data) {
		    	var artifact = $("div#wp").parents(".artifact"),
		    		forwardButton = artifact.find(".forward"),
		    		pageTrackerInnerDiv = $(".pageTracker div:last-child"),
		    		continueButton = pageTrackerInnerDiv.find("button:nth-of-type(2)");

		    	if (!artifact.hasClass('rated')){
		    		ratedCheck(artifact, forwardButton);
		    	}

		    	var articlesRated = $(".rated").size();
		    	if (articlesRated === 5){
		   			if ($("#overlay").length !== 0){
		   				$(".pageTracker").animate({
			    			height: "140px"
			    		});
			    		pageTrackerInnerDiv.slideDown();
			    		$("#overlay").fadeIn(200);
			    		continueButton.on("click", function(){
			    			$("#overlay").fadeOut(200).remove();
			    			continueButton.fadeOut(200);
			    			pageTrackerInnerDiv.find("p").fadeOut(200);
			    			$(".pageTracker").animate({
			    				height: "60px"
			    			});
			    		})
		   			}
		    	}
		    },
		    error: function(request, status, error) {
		        console.log(error)
		    },
		    complete: function() {
	    	}
		});
	}

	function userCreate(){
		var creationDiv = $("#introduction"),
			go = creationDiv.find("button:nth-of-type(2)");
		// creationDiv.find("button:nth-of-type(1)").show();
		creationDiv.slideDown(800, function(){
			window.setTimeout(playInstructions, 1000);

		});
		go.on("click", function(){
			console.log("clickedgo");
			var email = creationDiv.find("input").val();
			if (IsEmail(email)){
				$.ajax({
				    url:"user/create",
				    dataType: 'json',
				    data: {
				    	email: email
				    },
				    success: function(data) {
				    	$.cookie('user', data.user, { expires: 7, path: '/' });
				       	setUpSurveyDoms(data.userGroup);
						addNavListeners();
						addWidgetListeners();

				    },
				    error: function(request, status, error) {
				        console.log(error)
				    },
				    complete: function() {
			    	}
				});
				$("#overlay").fadeOut(800);
				creationDiv.animate({
					height: '80'
				}, 400, function(){
					$this = $(this);
					$this.find("div").html("Thank you!");
					setTimeout(function(){
						$this.slideUp();
					}, 800);
				});
			} else {
				$(".emailError").slideDown();
			}
			$(document).off("keyup");
		});
	}

	function playInstructions(){
		var stepDelay = 2000,
			creationDiv = $("#introduction").children(),
			panel = $(".panel"),
			emailBox = creationDiv.find("input"),
			emailPromptStep = creationDiv.find("p > span"),
			navStep = creationDiv.find("li:nth-child(1)"),
			rateStep = creationDiv.find("li:nth-child(2)"),
			emailError = $(".emailError"),
			continueInstructions = $("div#beginDiv > p > a, div#beginDiv > button:nth-of-type(1)"),
			navButtons = $('.colleft, .colright'),
			go = $("div#beginDiv > button:nth-of-type(2)");
		emailPromptStep.addClass("glow");
		emailBox.focus().animate({
			height: "30px",
			opacity: "1"
		}, 600);

		continueInstructions.on("click", function(){
			var email = emailBox.val();
			if (IsEmail(email)){
				creationDiv.find("h3").slideDown();
				emailBox.add("div#beginDiv > p").add("div#beginDiv > button:nth-of-type(1)").add(emailError).add(creationDiv.children("h1")).add(creationDiv.children("p")).animate({opacity: 'hide', height: 'hide'}, 'slow');
				emailPromptStep.removeClass("glow");
				navStep.slideDown();
				$("#contentPointer").slideDown().delay(stepDelay).slideUp();
				navButtons.fadeIn(200).promise().done(function(){

					setTimeout(function(){
						navStep.removeClass("glow");
						rateStep.slideDown();
						panel.css("z-index", 3).show("fast");
						$("a.trigger").animate({
							left:0
						}, {
							complete: function(){
								setTimeout(function(){

									rateStep.removeClass("glow");
									panel.css("z-index", 1).hide("fast");
									go.slideDown();
									$(document).off("keyup").on("keyup", function(event){
							    		if(event.which == 13) {
							    			go.click();
							    		}
									});
								}, stepDelay)
							}
						});
					}, stepDelay);

				});
			} else {
				emailError.slideDown();
			}

		});
		emailBox.on("keyup", function(event){
    		if(event.which == 13) {
    			continueInstructions.click();
    			emailBox.blur();
    		}
		});
	}



	function getPreviousResponses(user){
		$.ajax({
		    url:"user/previousResponses",
		    dataType: 'json',
		    data: {
		    	user: user
		    },
		    success: function(data) {
		    	$.each(data.stars, function(k, v){
		    		var rating = $("#"+v.domId);
		    		rating.attr('checked', 'checked').parents(".artifact").addClass("rated");
		    	});
		    	$.each(data.posNeg, function(k, v){
		    		var rating = $("#"+v.domId);
		    		rating.addClass("checked").parents(".artifact").addClass("rated");
		    	});
		    	var rated = $(".rated");
		    	rated.find(".forward").off("click").on("click", nextArticleHandler);
		    	if (rated.size() === 5){
		    		var endNotice = $("#introduction").find("div");
		    		endNotice.html("You have rated at least 5 articles. Thanks so much! You may continue, or stop right here.  ")
		    		.end()
		    		.slideDown();
		    		$("<a/>", {
		    			text: "[close]",
		    			href: "#"
		    		}).appendTo(endNotice).on("click", function(){
		    			endNotice.parent().slideUp();
		    		})
		    	}

		    	setUpSurveyDoms(data.userGroup);
		    	// console.log(parseInt(data.pageNumber-1));
		    	pageContentSetup(parseInt(data.pageNumber-1));
		    	$(".pageTracker > span").html(data.pageNumber);

		    },
		    error: function(request, status, error) {
		        console.log(error)
		    },
		    complete: function() {
	    	}
		});
	}

	function IsEmail(email) {
  		var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  		return regex.test(email);
	}

	function setUpSurveyDoms(userGroup){
		switch(userGroup)
		{
		case 0:
			$(".objectiveSingle").remove();
			break;
		case 1:
			$(".objectiveMultiple").remove();
		  	break;
		case 2:
		 	$(".objectiveSingle").remove();
			$(".agreement").remove();
		  	break;
		case 3:
		  	$(".objectiveMultiple").remove();
			$(".agreement").remove();
		  	break;
		default:
		  	console.log(userGroup);
		}
	}

	function timerIncrement() {
    	idleTime = idleTime + 1;
	    if (idleTime > 2 && $('.panel').is(':visible')) { // 2 minutes
	        $("a.trigger").tooltipster({
	        	animation: "fall",
	        	timer: 10000,
	        	position: "right",
	        	trigger: "custom"
	        }).tooltipster("show");

	        idleTime = 0;
	    }
	}

    // Sample data //
    function onReady() {
        $.ajax({
            url:"article/shuffled",
            dataType: 'json',
            data: {},
            error: function(request, status, error) {
                console.log(error)
            }
        }).done(articlesLoaded);
    }

    function articlesLoaded(articles) {
        var template = Handlebars.compile($('#template').html()),
            idleTime = 0;
        $(".main-container").append(template(articles));

        $(".panel").find("input").on("click", function(e){
            var $this = $(this);
            sendSurveyResponse($this.attr("class"), $this.attr("id"), $this.val());
        })

        $("button.depth.negative, button.depth.positive").on("click",function(){
            var $this = $(this),
                opposite;
            if ($this.hasClass("negative")){
                opposite = $this.parent().find("button.depth.positive");
            } else {
                opposite = $this.parent().find("button.depth.negative");
            }
            $this.addClass("checked");
            opposite.removeClass("checked");
            sendSurveyResponse($this.data("field"), $this.attr("id"), $this.val());
        });

        $(":input[placeholder]").placeholder();
        var user = $.cookie('user');
        if (typeof user != 'undefined'){
            $("#overlay").hide();
            $("a.trigger").animate({left:0});

            addNavListeners();
            addWidgetListeners();
            getPreviousResponses(user);
            $('.colleft, .colright').show();
        } else {
            pageContentSetup(0);
            userCreate();
        }
        $('a[href^="//en"]').attr('target','_blank').on("click", function(){
            sendAction($(this).attr("href"));
        });

        //Increment the idle time counter every minute.
        var idleInterval = setInterval(timerIncrement, 60000); // 1 minute

        //Zero the idle timer on mouse movement.
        $(this).click(function (e) {
            idleTime = 0;
        });
    }

    $(document).ready(onReady);

})( jQuery );


