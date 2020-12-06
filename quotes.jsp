<%-- 
    Document   : quotes
    Created on : Nov 22, 2020, 6:37:31 PM
    Author     : aronk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="starwars.css" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
    </head>
    <body onload="readfileautomatically();">
        <div class="text-center">
    <h1><img src="https://upload.wikimedia.org/wikipedia/commons/6/6c/Star_Wars_Logo.svg" alt="Star Wars" class="StarWarsLogo"/></h1>
    <h2>Random Quote Generator</h2>
    </div>

        <h1 id="line1"></h1>
        <button onclick="goBack()">Go Back</button>

        <script>
            function readfileautomatically() {
                var client = new XMLHttpRequest();
                client.open('GET', 'starwarsquotes.txt');
                var number;
                client.onreadystatechange = function ()
                {
                    var txt = client.responseText.split("\n");
                    number = getRandomInt(102);
                    document.getElementById("line1").innerHTML = txt[number];
                };
                client.send();
            }
        </script>
        <script>
            function getRandomInt(max) {
                return Math.floor(Math.random() * Math.floor(max));
            }
        </script>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
    </body>

</html>
