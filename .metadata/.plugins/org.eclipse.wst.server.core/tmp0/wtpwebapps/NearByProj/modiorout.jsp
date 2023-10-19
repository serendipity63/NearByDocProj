<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Page Title</title>
    <style>
        #size {
            position: relative;
            width: 430px;
            height: 281px;
            background: #FFFFFF;
            margin: 10px auto;
        }

        #comment {
            position: absolute;
            width: 376px;
            height: 55px;
            left: calc(50% - 376px/2 + 10px);
            top: calc(50% - 55px/2 - 1px);
            font-family: 'Inter';
            font-style: normal;
            font-weight: 400;
            font-size: 30px;
            line-height: 36px;
            color: #000000;
        }

        #btnFrame {
            position: absolute;
            width: 119px;
            height: 47px;
            left: 156px;
            top: 178px;
        }

        #btnNo {
            position: absolute;
            width: 57px;
            height: 47px;
            left: 156px;
            top: 178px;
        }

        #noFrame {
            display: flex;
            flex-direction: row;
            align-items: flex-start;
            padding: 15px 30px;
            gap: 10px;
            position: absolute;
            width: 57px;
            height: 36px;
            left: 156px;
            top: 178px;
            background: #1376F8;
            border-radius: 10px;
        }

        #no {
            position: absolute;
            width: 41px;
            height: 36px;
            left: 164px;
            top: 189px;
            font-family: 'Telex';
            font-style: normal;
            font-weight: 400;
            font-size: 10px;
            line-height: 155%;
            text-align: center;
            letter-spacing: 0.015em;
            color: #FFFFFF;
        }

        #btnYes {
            position: absolute;
            width: 57px;
            height: 47px;
            left: 218px;
            top: 178px;
        }

        #yesFrame {
            display: flex;
            flex-direction: row;
            align-items: flex-start;
            padding: 15px 30px;
            gap: 10px;
            position: absolute;
            width: 57px;
            height: 36px;
            left: 218px;
            top: 178px;
            background: #78818C;
            border-radius: 10px;
        }

        #yes {
            position: absolute;
            width: 41px;
            height: 36px;
            left: 226px;
            top: 189px;
            font-family: 'Telex';
            font-style: normal;
            font-weight: 400;
            font-size: 10px;
            line-height: 155%;
            text-align: center;
            letter-spacing: 0.015em;
            color: #FFFFFF;
        }
    </style>
</head>
<body>
    <div id="size">
        <div id="comment">Your Comment Goes Here</div>
        <p id="btnFrame">
            <span id="noFrame">
                <div id="no">No</div>
            </span>
        	<span id="btnYes">
           	 <div id="yesFrame">
                <div id="yes">Yes</div>
             </div>
        	</span>
    	</p>
</body>
</html>
