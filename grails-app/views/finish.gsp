<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Poliwiki Survey</title>
	</head>
	<body>
		%{-- <a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a> --}%
		<div class="header-container">
            <!-- <header class="wrapper clearfix">
            	<div id="PoliwikiLogo" class="title" role="banner">
            		<a href="http://poliwiki.macalester.edu/Poliwiki/"><img src="${resource(dir: 'images', file: 'poliwiki_logo.png')}" alt="Poliwiki"/></a>
            	</div>
            </header> -->
        </div>
        <div class="finishContainer" role="main">
        	<h1>Thank you for your time</h1>
            <h3>Would you tell us more about the subjects you rated?</h3>
            <div class="agreement-container">
                <script id="template" type="text/x-handlebars-template">
                {{#each this}}
                    <div>hi</div>
                {{/each}}
                </script>
            </div>

            <textarea placeholder="So, what did you think about the survey?"></textarea>
            <div>
                <button>Submit</button>
            </div>
        	</section>
        </div>
        <script type="text/javascript">

            (function($){$.fn.autoResize=function(options){var settings=$.extend({onResize:function(){},animate:true,animateDuration:150,animateCallback:function(){},extraSpace:20,limit:1000},options);this.filter('textarea').each(function(){var textarea=$(this).css({resize:'none','overflow-y':'hidden'}),origHeight=textarea.height(),clone=(function(){var props=['height','width','lineHeight','textDecoration','letterSpacing'],propOb={};$.each(props,function(i,prop){propOb[prop]=textarea.css(prop)});return textarea.clone().removeAttr('id').removeAttr('name').css({position:'absolute',top:0,left:-9999}).css(propOb).attr('tabIndex','-1').insertBefore(textarea)})(),lastScrollTop=null,updateSize=function(){clone.height(0).val($(this).val()).scrollTop(10000);var scrollTop=Math.max(clone.scrollTop(),origHeight)+settings.extraSpace,toChange=$(this).add(clone);if(lastScrollTop===scrollTop){return}lastScrollTop=scrollTop;if(scrollTop>=settings.limit){$(this).css('overflow-y','');return}settings.onResize.call(this);settings.animate&&textarea.css('display')==='block'?toChange.stop().animate({height:scrollTop},settings.animateDuration,settings.animateCallback):toChange.height(scrollTop)};textarea.unbind('.dynSiz').bind('keyup.dynSiz',updateSize).bind('keydown.dynSiz',updateSize).bind('change.dynSiz',updateSize)});return this}})(jQuery);

            (function( $ ) {



                $('textarea').autoResize();
                $('button').on("click", function(){
                    if ($("textarea").val()){
                        $.ajax({
                            url:"user/comments",
                            type: "POST",
                            data: {
                                comments: $("textarea").val(),
                                userId: $.cookie("user")
                            },
                            success: function(data) {
                                console.log("sent");
                                var container = $(".finishContainer");
                                container.find("textarea").animate({
                                    opacity: 0,
                                    height: 0
                                }).end().find("div").css("width","150px").html("Sent! Thank you!")
                            },
                            error: function(request, status, error) {
                                console.log(error)
                            },
                            complete: function() {
                            }
                        });
                    }
                });
                $(document).ready(function(){
                    var userId = $.cookie('user'),
                        data = new Array(),
                        template = Handlebars.compile($('#template').html());

                    $(".agreement-container").append(template(data));
                });

            })( jQuery );
        </script>
	</body>
</html>
