<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Rating Survey</title>
	</head>
	<body>
		<div id="overlay"></div>
		%{-- <a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a> --}%
		%{-- <div class="header-container">
            <header class="wrapper clearfix">
            	<div id="PoliwikiLogo" class="title" role="banner">
            		<a href="http://poliwiki.macalester.edu/Poliwiki/"><img src="${resource(dir: 'images', file: 'poliwiki_logo.png')}" alt="Poliwiki"/></a>
            	</div>
            </header>
        </div> --}%
		<div class="pageTracker">
				Page <span>1</span>
				<div>
					<p>You have rated at least 5 articles. Thanks so much! You may continue, or stop right here.</p>
					<button onclick="window.location='finish';">Finish Survey</button><button>Keep Rating</button>
				</div>
		</div>

		<div id="page-body" role="main">

			<div class="creationDiv" id="introduction">
				<div>
					<h1>Thank you for taking part in the Rating Survey!</h1>
					<p>The goal of this project is to understand the effects different rating systems.
						You will be rating a set of five Wikipedia pages on a variety of topics.
						The survey should take about 10 minutes to complete.</p>
					<p>Please <a href="consent">read the terms of the study</a>, and <span>Fill your email at the bottom.</span></p>
					<h3>Instructions:</h3>
					<blockquote>
						<ul>
							<li class="glow">Flip through the wiki pages using the <i class="icon-circle-arrow-left"></i> and <i class="icon-circle-arrow-right"></i> buttons, or your left and right arrow keys.</li>
							<li class="glow">Rate each page using the rating widget on the left side of the page</li>
						</ul>
					</blockquote>
					<div id="beginDiv">
						<input type="text" name="Email" placeholder="Enter your email here">
						<button>Continue</button>
						<p>By pressing <a href="#">continue</a>, you agree that you are at least 18 years of age and consent to the terms of the study.</p>
						<button id="createUser">GO</button>%{-- <button>Watch instructions again</button> --}%
						<span class="emailError">Please enter a valid email address</span>
					</div>
				</div>
			</div>
			<div class="creationDiv" id="contentPointer">
				<p>↓ Content ↓</p>
			</div>

			<a class="trigger" href="#" title="Click me to rate this page!">rate</a>


			<div class="main-container">


	            <script id="template" type="text/x-handlebars-template">
	                {{#each this}}


	                <div class="main wrapper clearfix artifact articleId{{id}}">

                        <div class="columns">
							<div class="colleft">
								<button class="previous depth"><i class="icon-arrow-left"></i></button>
							</div>

							<div class="colright">
								<button class="forward depth" title="Warning: you have yet to rating this page. Rate to continue."><i class="icon-arrow-right"></i></button>
							</div>
						</div>
	                    <article>
	                        <header>
	                            <h1>{{title}}</h1>
	                        </header>
	                        <section>
	                            <h2>Content</h2>
	                            <div class="wikiContent">
	                                {{{content}}}
	                            </div>
	                        </section>

	                    </article>

	                    <aside class=panel>

							<div class='ratingSet objectiveMultiple'>
		                        <fieldset class="rating trustworthy">
		                            <legend>Trustworthy</legend>
		                            <input type="radio" class="trustworthy{{id}}" id="trustworthyStar5-{{id}}" name="trustworthyRating-{{id}}" value="5" /><label for="trustworthyStar5-{{id}}" title="Great reputable sources">5 stars</label>
		                            <input type="radio" class="trustworthy{{id}}" id="trustworthyStar4-{{id}}" name="trustworthyRating-{{id}}" value="4" /><label for="trustworthyStar4-{{id}}" title="Good reputable sources">4 stars</label>
		                            <input type="radio" class="trustworthy{{id}}" id="trustworthyStar3-{{id}}" name="trustworthyRating-{{id}}" value="3" /><label for="trustworthyStar3-{{id}}" title="Adequate reputable sources">3 stars</label>
		                            <input type="radio" class="trustworthy{{id}}" id="trustworthyStar2-{{id}}" name="trustworthyRating-{{id}}" value="2" /><label for="trustworthyStar2-{{id}}" title="Few reputable sources">2 stars</label>
		                            <input type="radio" class="trustworthy{{id}}" id="trustworthyStar1-{{id}}" name="trustworthyRating-{{id}}" value="1" /><label for="trustworthyStar1-{{id}}" title="Lacks reputable sources">1 star</label>
		                        </fieldset>
		                        <fieldset class="rating objective">
		                            <legend>Objective</legend>
		                            <input type="radio" class="objective{{id}}" id="objectiveStar5-{{id}}" name="objectiveRating-{{id}}" value="5" /><label for="objectiveStar5-{{id}}" title="Completely unbiased">5 stars</label>
		                            <input type="radio" class="objective{{id}}" id="objectiveStar4-{{id}}" name="objectiveRating-{{id}}" value="4" /><label for="objectiveStar4-{{id}}" title="No obvious bias">4 stars</label>
		                            <input type="radio" class="objective{{id}}" id="objectiveStar3-{{id}}" name="objectiveRating-{{id}}" value="3" /><label for="objectiveStar3-{{id}}" title="Minimal bias">3 stars</label>
		                            <input type="radio" class="objective{{id}}" id="objectiveStar2-{{id}}" name="objectiveRating-{{id}}" value="2" /><label for="objectiveStar2-{{id}}" title="Moderate bias">2 stars</label>
		                            <input type="radio" class="objective{{id}}" id="objectiveStar1-{{id}}" name="objectiveRating-{{id}}" value="1" /><label for="objectiveStar1-{{id}}" title="Heavily biased">1 star</label>
		                        </fieldset>
		                        <fieldset class="rating complete">
		                            <legend>Complete</legend>
		                            <input type="radio" class="complete{{id}}" id="completeStar5-{{id}}" name="completeRating-{{id}}" value="5" /><label for="completeStar5-{{id}}" title="Comprehensive coverage">5 stars</label>
		                            <input type="radio" class="complete{{id}}" id="completeStar4-{{id}}" name="completeRating-{{id}}" value="4" /><label for="completeStar4-{{id}}" title="Contains most key information">4 stars</label>
		                            <input type="radio" class="complete{{id}}" id="completeStar3-{{id}}" name="completeRating-{{id}}" value="3" /><label for="completeStar3-{{id}}" title="Contains key information, but with gaps">3 stars</label>
		                            <input type="radio" class="complete{{id}}" id="completeStar2-{{id}}" name="completeRating-{{id}}" value="2" /><label for="completeStar2-{{id}}" title="Contains some information">2 stars</label>
		                            <input type="radio" class="complete{{id}}" id="completeStar1-{{id}}" name="completeRating-{{id}}" value="1" /><label for="completeStar1-{{id}}" title="Missing most information">1 star</label>
		                        </fieldset>
		                        <fieldset class="rating wellwritten">
		                            <legend>Well-written</legend>
		                            <input type="radio" class="wellwritten{{id}}" id="wellwrittenStar5-{{id}}" name="wellwritten-{{id}}" value="5" /><label for="wellwrittenStar5-{{id}}" title="Exceptional clarity">5 stars</label>
		                            <input type="radio" class="wellwritten{{id}}" id="wellwrittenStar4-{{id}}" name="wellwritten-{{id}}" value="4" /><label for="wellwrittenStar4-{{id}}" title="Good clarity">4 stars</label>
		                            <input type="radio" class="wellwritten{{id}}" id="wellwrittenStar3-{{id}}" name="wellwritten-{{id}}" value="3" /><label for="wellwrittenStar3-{{id}}" title="Adequate clarity">3 stars</label>
		                            <input type="radio" class="wellwritten{{id}}" id="wellwrittenStar2-{{id}}" name="wellwritten-{{id}}" value="2" /><label for="wellwrittenStar2-{{id}}" title="Difficult to understand">2 stars</label>
		                            <input type="radio" class="wellwritten{{id}}" id="wellwrittenStar1-{{id}}" name="wellwritten-{{id}}" value="1" /><label for="wellwrittenStar1-{{id}}" title="Incomprehensible">1 star</label>
		                        </fieldset>
	                        </div>
							<div style="clear:both;"></div>
							<div class='ratingSet objectiveSingle'>
								<fieldset class="rating quality">
		                            <legend>Article Quality</legend>
		                           	 <input type="radio" class="quality{{id}}" id="qualityStar5-{{id}}" name="quality-{{id}}" value="5" /><label for="qualityStar5-{{id}}" title="Exceptional Quality">5 stars</label>
		                            <input type="radio" class="quality{{id}}" id="qualityStar4-{{id}}" name="quality-{{id}}" value="4" /><label for="qualityStar4-{{id}}" title="Good Quality">4 stars</label>
		                            <input type="radio" class="quality{{id}}" id="qualityStar3-{{id}}" name="quality-{{id}}" value="3" /><label for="qualityStar3-{{id}}" title="Adequate Quality">3 stars</label>
		                            <input type="radio" class="quality{{id}}" id="qualityStar2-{{id}}" name="quality-{{id}}" value="2" /><label for="qualityStar2-{{id}}" title="Bad Quality">2 stars</label>
		                            <input type="radio" class="quality{{id}}" id="qualityStar1-{{id}}" name="quality-{{id}}" value="1" /><label for="qualityStar1-{{id}}" title="Horrible Quality">1 star</label>
		                        </fieldset>
							</div>
							<div class='ratingSet agreement'>
								<fieldset class="rating agreement">
		                            <legend>Agreement</legend>
		                            <p>{{agreementQuestion}}</p>
		                           	<input type="radio" class="agreement{{id}}" id="agreementStar5-{{id}}" name="agreement-{{id}}" value="5" /><label for="agreementStar5-{{id}}" title="Completely Agree">5 stars</label>
		                            <input type="radio" class="agreement{{id}}" id="agreementStar4-{{id}}" name="agreement-{{id}}" value="4" /><label for="agreementStar4-{{id}}" title="Mildly Agree">4 stars</label>
		                            <input type="radio" class="agreement{{id}}" id="agreementStar3-{{id}}" name="agreement-{{id}}" value="3" /><label for="agreementStar3-{{id}}" title="Neutral/Mixed">3 stars</label>
		                            <input type="radio" class="agreement{{id}}" id="agreementStar2-{{id}}" name="agreement-{{id}}" value="2" /><label for="agreementStar2-{{id}}" title="Mildly Disagree">2 stars</label>
		                            <input type="radio" class="agreement{{id}}" id="agreementStar1-{{id}}" name="agreement-{{id}}" value="1" /><label for="agreementStar1-{{id}}" title="Completely Disagree">1 star</label>
		                        </fieldset>
							</div>

	                    </aside>

	                </div> <!-- #end template -->
	                {{/each}}
	            </script>

        	</div> <!-- #main-container -->



		</div>
		<div class="footer-container">
            <footer class="wrapper">
            	<div>This survey was developed by <a href="mailto:emmyrlim@gmail.com">Emmy Lim</a> with supervision from <a href="mailto:ssen@macalester.edu">Shilad Sen</a></div>
            </footer>
        </div>
        <g:javascript library="mainpage"/>
	</body>
</html>
