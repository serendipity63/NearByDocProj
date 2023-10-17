<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">

<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container mt-3">
  <h3>Modal Example</h3>
  <p>Click on the button to open the modal.</p>
  
  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
    Open modal
  </button>
</div>




<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">






      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title"> 진료시간을 선택해주세요 </h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
  <div class="row">
    <!-- 시작 시간 입력 필드 -->
    <div class="col">
      <div class="input-group">
        <input id="startTime" type="text" class="form-control" placeholder="hh:mm 형식">
      </div>
    </div>
~
    <!-- 종료 시간 입력 필드 -->
    <div class="col">
      <div class="input-group">
        <input id="endTime" type="text" class="form-control" placeholder="hh:mm 형식">
      </div>
    </div>
  </div>
  </div>
  
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>






    </div>
  </div>
</div>


</body>
</html>

</body>
</html>