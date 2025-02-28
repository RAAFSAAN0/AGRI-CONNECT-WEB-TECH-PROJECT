<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spin Wheel</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            background-color: #34495e;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            overflow: hidden;
        }

        .container {
            width: 500px;
            height: 500px;
            background-color: #ccc;
            border-radius: 50%;
            border: 15px solid #dde;
            position: relative;
            overflow: hidden;
            transition: 5s;
        }

        .container div {
            height: 50%;
            width: 200px;
            position: absolute;
            clip-path: polygon(100% 0, 50% 100%, 0 0);
            transform: translateX(-50%);
            transform-origin: bottom;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            font-weight: bold;
            font-family: sans-serif;
            color: #fff;
            left: 135px;
        }

        .container .one {
            background-color: #3f51b5;
            left: 50%;
        }

        .container .two {
            background-color: #ff9800;
            transform: rotate(45deg);
        }

        .container .three {
            background-color: #e91e63;
            transform: rotate(90deg);
        }

        .container .four {
            background-color: #4caf50;
            transform: rotate(135deg);
        }

        .container .five {
            background-color: #009688;
            transform: rotate(180deg);
        }

        .container .six {
            background-color: #795548;
            transform: rotate(225deg);
        }

        .container .seven {
            background-color: #9c27b0;
            transform: rotate(270deg);
        }

        .container .eight {
            background-color: #f44336;
            transform: rotate(315deg);
        }

        .arrow {
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            color: #fff;
        }

        .arrow::before {
            content: "\1F817";
            font-size: 50px;
        }

        #spin {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 10;
            background-color: #e2e2e2;
            text-transform: uppercase;
            border: 8px solid #fff;
            font-weight: bold;
            font-size: 20px;
            color: #a2a2a2;
            width: 80px;
            height: 80px;
            font-family: sans-serif;
            border-radius: 50%;
            cursor: pointer;
            outline: none;
            letter-spacing: 1px;
        }
    </style>
</head>
<body>
    <button id="spin">Spin</button>
    <span class="arrow"></span>
    <div class="container">
        <div class="one">1</div>
        <div class="two">2</div>
        <div class="three">3</div>
        <div class="four">4</div>
        <div class="five">5</div>
        <div class="six">6</div>
        <div class="seven">7</div>
        <div class="eight">8</div>
    </div>
    <script>
        let container = document.querySelector(".container");
        let btn = document.getElementById("spin");
        let number = Math.ceil(Math.random() * 1000);

        btn.onclick = function () {
            container.style.transform = "rotate(" + number + "deg)";
            number += Math.ceil(Math.random() * 1000);
        }
    </script>
</body>
</html>
