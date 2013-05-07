<%@ page import="org.grails.poliwikisurvey.SurveyPage" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'css',file:'normalize.min.css')}" />
        <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
        <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'css',file:'rating.css')}" />
        <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'css',file:'wpstyle.css')}" />

        <!-- <link rel="stylesheet" href="css/main.css"> -->
        <!-- <link rel="stylesheet" href="css/rating.css"> -->
        <!-- <link rel="stylesheet" href="css/wpstyle.css"> -->


        <script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an outdated browser. <a href="http://browsehappy.com/">Upgrade your browser today</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to better experience this site.</p>
        <![endif]-->

        <div class="header-container">
            <header class="wrapper clearfix">
                <h1 class="title">h1.title</h1>
                <nav>
                    <ul>
                        <li><a href="#">nav ul li a</a></li>
                        <li><a href="#">nav ul li a</a></li>
                        <li><a href="#">nav ul li a</a></li>
                    </ul>
                </nav>
            </header>
        </div>

        <div class="main-container">

            <script id="template" type="text/x-handlebars-template">
                {{#each this}}
                <div class="main wrapper clearfix artifact">
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
                        <footer>
                            <h3>Footer</h3>
                        </footer>
                    </article>

                    <aside>
                        <h3>rating</h3>
                            <fieldset class="rating trustworthy">
                                <legend>Trustworthy</legend>
                                <input type="radio" id="trustworthyStar5-{{id}}" name="trustworthyRating-{{id}}" value="5" /><label for="trustworthyStar5-{{id}}" title="Great reputable sources">5 stars</label>
                                <input type="radio" id="trustworthyStar4-{{id}}" name="trustworthyRating-{{id}}" value="4" /><label for="trustworthyStar4-{{id}}" title="Good reputable sources">4 stars</label>
                                <input type="radio" id="trustworthyStar3-{{id}}" name="trustworthyRating-{{id}}" value="3" /><label for="trustworthyStar3-{{id}}" title="Adequate reputable sources">3 stars</label>
                                <input type="radio" id="trustworthyStar2-{{id}}" name="trustworthyRating-{{id}}" value="2" /><label for="trustworthyStar2-{{id}}" title="Few reputable sources">2 stars</label>
                                <input type="radio" id="trustworthyStar1-{{id}}" name="trustworthyRating-{{id}}" value="1" /><label for="trustworthyStar1-{{id}}" title="Lacks reputable sources">1 star</label>
                            </fieldset>
                            <fieldset class="rating objective">
                                <legend>Objective</legend>
                                <input type="radio" id="objectiveStar5-{{id}}" name="objectiveRating-{{id}}" value="5" /><label for="objectiveStar5-{{id}}" title="Complete unbiased">5 stars</label>
                                <input type="radio" id="objectiveStar4-{{id}}" name="objectiveRating-{{id}}" value="4" /><label for="objectiveStar4-{{id}}" title="No obvious bias">4 stars</label>
                                <input type="radio" id="objectiveStar3-{{id}}" name="objectiveRating-{{id}}" value="3" /><label for="objectiveStar3-{{id}}" title="Minimal bias">3 stars</label>
                                <input type="radio" id="objectiveStar2-{{id}}" name="objectiveRating-{{id}}" value="2" /><label for="objectiveStar2-{{id}}" title="Moderate bias">2 stars</label>
                                <input type="radio" id="objectiveStar1-{{id}}" name="objectiveRating-{{id}}" value="1" /><label for="objectiveStar1-{{id}}" title="Heavily biased">1 star</label>
                            </fieldset>
                            <fieldset class="rating complete">
                                <legend>Complete</legend>
                                <input type="radio" id="completeStar5-{{id}}" name="completeRating-{{id}}" value="5" /><label for="completeStar5-{{id}}" title="Comprehensive coverage">5 stars</label>
                                <input type="radio" id="completeStar4-{{id}}" name="completeRating-{{id}}" value="4" /><label for="completeStar4-{{id}}" title="Contains most key information">4 stars</label>
                                <input type="radio" id="completeStar3-{{id}}" name="completeRating-{{id}}" value="3" /><label for="completeStar3-{{id}}" title="Contains key information, but with gaps">3 stars</label>
                                <input type="radio" id="completeStar2-{{id}}" name="completeRating-{{id}}" value="2" /><label for="completeStar2-{{id}}" title="Contains some information">2 stars</label>
                                <input type="radio" id="completeStar1-{{id}}" name="completeRating-{{id}}" value="1" /><label for="completeStar1-{{id}}" title="Missing most information">1 star</label>
                            </fieldset>
                            <fieldset class="rating wellwritten">
                                <legend>Well-written</legend>
                                <input type="radio" id="wellwrittenStar5-{{id}}" name="wellwritten-{{id}}" value="5" /><label for="wellwrittenStar5-{{id}}" title="Exceptional clarity">5 stars</label>
                                <input type="radio" id="wellwrittenStar4-{{id}}" name="wellwritten-{{id}}" value="4" /><label for="wellwrittenStar4-{{id}}" title="Good clarity">4 stars</label>
                                <input type="radio" id="wellwrittenStar3-{{id}}" name="wellwritten-{{id}}" value="3" /><label for="wellwrittenStar3-{{id}}" title="Adequate clarity">3 stars</label>
                                <input type="radio" id="wellwrittenStar2-{{id}}" name="wellwritten-{{id}}" value="2" /><label for="wellwrittenStar2-{{id}}" title="Difficult to understand">2 stars</label>
                                <input type="radio" id="wellwrittenStar1-{{id}}" name="wellwritten-{{id}}" value="1" /><label for="wellwrittenStar1-{{id}}" title="Incomprehensible">1 star</label>
                            </fieldset>
                        <button class="previous">previous</button>
                        <button class="forward">next</button>
                    </aside>

                </div> <!-- #end template -->
                {{/each}}
            </script>

        </div> <!-- #main-container -->

        <div class="footer-container">
            <footer class="wrapper">
                <h3>footer</h3>
            </footer>
        </div>

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="../js/vendor/jquery-1.8.2.min.js"><\/script>')</script>

<!--         // <script src="js/plugins.js"></script>
        // <script src="js/main.js"></script> -->

        <script type="text/javascript" src="${createLinkTo(dir:'js',file:'plugins.js')}"></script>
        <script type="text/javascript" src="${createLinkTo(dir:'js',file:'main.js')}"></script>

        <script>
            var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
            (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
            g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
            s.parentNode.insertBefore(g,s)}(document,'script'));
        </script>
    </body>
</html>
