<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Verify Register</title>
    </head>
    <body>
        <div class="container">
            <h1>{{ $fname . ' ' . $lname }}</h1>
            <div class="clearfix"></div>
            <div class="row profile shop">
                <div class="col-md-6">
                    <div id="outer" style="width: 100%;margin: 0 auto;background-color:#cccccc; padding:10px;">  
                        <div id="inner" style="width: 80%;margin: 0 auto;background-color: #fff;font-family: Open Sans,Arial,sans-serif;font-size: 13px;
                             font-weight: normal;line-height: 1.4em;color: #444;margin-top: 10px; padding:10px;">
                            <h3>Please verify your account.</h3>
                            <br>
                            <a href="{{$link}}">{{ $link}}</a>
                            <br>
                            <p>Thank you.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="height30"></div>
            <div class="row">
            </div>
        </div>
    </body>
</html>