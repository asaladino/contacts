<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Contacts</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
        <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
        <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
        
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'foundation.min.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'normalize.css')}" type="text/css">
        
        <g:layoutHead/>
        <r:layoutResources />
        
        <g:javascript library="application"/>
        <script src="${resource(dir: 'js', file: 'vendor/jquery.js')}" type="text/javascript"></script>
        <script src="${resource(dir: 'js', file: 'vendor/modernizr.js')}" type="text/javascript"></script>
</head>
<body>
    <div class="row" role="banner">
        <div class="large-12 columns">
            <h1>Contacts</h1>
            <hr/>
        </div>
    </div>
    <div class="row">
        <div class="large-12 columns">
            <g:layoutBody/>
        </div>
    </div>
    <div class="row footer" role="contentinfo">
        <div class="large-12 columns">
        </div>
    </div>
    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>
    <r:layoutResources />

    <script src="${resource(dir: 'js', file: 'foundation.min.js')}" type="text/javascript"></script>
    <script src="${resource(dir: 'js', file: 'foundation/foundation.reveal.js')}" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $(document).foundation();
        });
    </script>
</body>
</html>
