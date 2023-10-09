<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약하기</title>
    <style>
        .main {
            width: 430px;
            margin: auto;
        }

        .top {
            text-align: center;
            margin: auto;
            border-bottom: 1px solid;
        }

        .patientselect {
            border-bottom: 1px solid;
            border-color: gainsboro;
        }
        .selectservice {
            border-bottom: 1px solid;
            border-color: gainsboro;
        }
        
        .selectdate {
            border-bottom: 1px solid;
            border-color: gainsboro;
        }
        .selecttime {
            border-bottom: 1px solid;
            border-color: gainsboro;
        }
        button {
            margin-left: 20px;
        }
        .button {
            margin:auto;
            text-align: center;
        }
        #text {
            width:410px;
            height:300px;
            margin: 5px 5px 5px 5px;
        }
        .btn-primary {
            width: 410px;
            background-color: #1376F8;
            border-radius: 10px;
            border-color: white;
            color: white;
            padding: 15px 30px;
            text-align: center;
            font-size: 16px;
            margin: auto;
        }
		.sub {
            font-weight: bold;
        }
        
    </style>
</head>

<body>
    <div class="main">
        <% pageContext.include("header.jsp"); %>
        <br>
        <div class="top">
            <h3>예약하기 (OOO종합병원)</h3>
        </div>
        <br>
        <div class="patientselect">
            <p class="sub">진료 대상 선택</p>
            <br>
            <table>
                <tbody>
                    <tr>
                        <td width="100">
                            <img src="image?file=lee.jpg" alt="이강인" width="60" height="60">
                        </td>
                        <td width="100">
                            <img src="image?file=kim.jpg" alt="김민재" width="60" height="60">
                        </td>
                        <td width="100">
                            <img src="image?file=son.jpg" alt="손흥민" width="60" height="60">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="name">&nbsp;이강인
                        </td>
                        <td>
                            <input type="radio" name="name">&nbsp;김민재
                        </td>
                        <td>
                            <input type="radio" name="name">&nbsp;손흥민
                        </td>
                    </tr>
                </tbody>
            </table>
            <br>
        </div>
        <br>
        <div class="selectservice">
            <p class="sub">진료과목 선택</p>
            <br>
            <input type="radio" name="department">&nbsp;정형외과&nbsp;&nbsp;
            <input type="radio" name="department">&nbsp;내과
            <br><br>
        </div>
        <br>
        <div class="selectdate">
            <p class="sub">날짜선택</p>
            <br>
            <div class="calendar-wrap">
                <h2 class="month-year">January 2020</h2>
              
                <table class="calendar">
                  <thead>
                    <tr>
                      <th class="day-title" scope="col">Sun</th>
                      <th class="day-title" scope="col">Mon</th>
                      <th class="day-title" scope="col">Tue</th>
                      <th class="day-title" scope="col">Wed</th>
                      <th class="day-title" scope="col">Thu</th>
                      <th class="day-title" scope="col">Fri</th>
                      <th class="day-title" scope="col">Sat</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr class="week">
                      
                      <td class="day prev-mon" tabindex="0"><span class="day-number">29</span></td>
                      <td class="day prev-mon" tabindex="0"><span class="day-number">30</span></td>
                      <td class="day prev-mon" tabindex="0"><span class="day-number">31</span></td>
                      <td class="day" tabindex="0"><span class="day-number">1</span></td>
                      <td class="day today" tabindex="0"><span class="day-number">2</span></td>
                      <td class="day" tabindex="0"><span class="day-number">3</span></td>
                      <td class="day" tabindex="0"><span class="day-number">4</span></td>
                    </tr>
                    <tr class="week">
                      <td class="day" tabindex="0"><span class="day-number">5</span></td>
                      <td class="day" tabindex="0"><span class="day-number">6</span></td>
                      <td class="day" tabindex="0"><span class="day-number">7</span></td>
                      <td class="day" tabindex="0"><span class="day-number">8</span></td>
                      <td class="day" tabindex="0"><span class="day-number">9</span></td>
                      <td class="day" tabindex="0"><span class="day-number">10</span></td>
                      <td class="day" tabindex="0"><span class="day-number">11</span></td>
                    </tr>
                    <tr class="week">
                      <td class="day" tabindex="0"><span class="day-number">12</span></td>
                      <td class="day" tabindex="0"><span class="day-number">13</span></td>
                      <td class="day" tabindex="0"><span class="day-number">14</span></td>
                      <td class="day" tabindex="0"><span class="day-number">15</span></td>
                      <td class="day" tabindex="0"><span class="day-number">16</span></td>
                      <td class="day" tabindex="0"><span class="day-number">17</span></td>
                      <td class="day" tabindex="0"><span class="day-number">18</span></td>
                    </tr>
                    <tr class="week">
                      <td class="day" tabindex="0"><span class="day-number">19</span></td>
                      <td class="day" tabindex="0"><span class="day-number">20</span></td>
                      <td class="day" tabindex="0"><span class="day-number">21</span></td>
                      <td class="day" tabindex="0"><span class="day-number">22</span></td>
                      <td class="day" tabindex="0"><span class="day-number">23</span></td>
                      <td class="day" tabindex="0"><span class="day-number">24</span></td>
                      <td class="day" tabindex="0"><span class="day-number">25</span></td>
                    </tr>
                    <tr class="week">
                      <td class="day" tabindex="0"><span class="day-number">26</span></td>
                      <td class="day" tabindex="0"><span class="day-number">27</span></td>
                      <td class="day" tabindex="0"><span class="day-number">28</span></td>
                      <td class="day" tabindex="0"><span class="day-number">29</span></td>
                      <td class="day" tabindex="0"><span class="day-number">30</span></td>
                      <td class="day" tabindex="0"><span class="day-number">31</span></td>
                      <td class="day next-mon" tabindex="0"><span class="day-number">1</span></td>
                    </tr>
                  </tbody>
                </table>
                
                <br>
              </div>
        </div>
        <br>
        <div class="selecttime">
            <p class="sub">시간선택</p>
            <br>
            <button>09:00</button><button>09:30</button><button>10:00</button><button>10:30</button><button>11:00</button><button>11:30</button><button>13:00</button><button>13:30</button><button>14:00</button><button>14:30</button><button>15:00</button><button>15:30</button><button>16:00</button><button>16:30</button><button>17:00</button><button>17:30</button>
            <br><br>
        </div>
        <br>
        <div class="comment">
            <p class="sub">원장님께 하고 싶은말:</p>
            <br>
            <textarea cols="58" rows="2" placeholder="증상을 입력해주세요."></textarea>
        </div>
        <br>
        <div class="button">
            <button type="button" class="btn-primary" onclick="location.href='completereservation.jsp';">예약하기</button>
        </div>
        <h1>푸터</h1>
    </div>
</body>

</html>