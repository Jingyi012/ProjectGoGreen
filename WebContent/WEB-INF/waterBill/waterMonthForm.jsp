<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/billForm.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<style>
    .pageContent{
        padding: 30px 60px;
    }
</style>
</head>
<body>
	<div class="pageContainer">
        <div class="sideBarContainer">
            <jsp:include page="../sidebar.jsp" />
        </div>
        
 
	    
        <div class="pageWrapper">
        	<jsp:include page="../headerBar.jsp" />
        	<div class="pageContent">
                <div class="pageNav">
					Home > 
					<a href="${pageContext.request.contextPath}/bills">Bills</a> >
					<a href="${pageContext.request.contextPath}/bills/waterBill">Water Bills</a> >
                    ${month} ${year}
				</div>
				<h2 class="pageTitle">Water Bills</h2>

				<div class="formContainer">
					<form action="${pageContext.request.contextPath}/bills/waterMonthForm/submit" method="post" enctype="multipart/form-data">
						<div class="billForm water">
							<label for="wBill" class="form-label">Insert Water Consumption (m&sup3):</label>
							<input type="text" id="wBill" class="form-control" name="wBill" placeholder="123" required>
						</div>
						
						<div class="billFile water">
							<label class="form-label">Upload Water Bill as proof:</label>
							<input type="file" id="wFile" class="form-control" name="wFile" accept="image/*" placeholder="Choose file" required aria-describedby="fileHelp">
							<div id="fileHelp" class="form-text">
								The image must less than 1 mb.
							</div>
						</div>
						
						<div class="submitButton">
						<input type="submit" value="Submit" id="btn">
						<input type="hidden" name="year" value="${year}"/>
						<input type="hidden" name="month" value="${month}"/>
						</div>
					</form>
				</div>
        	
        	
        	
        	</div>
        </div>
        
    </div>

</body>
<script>
    document.getElementById('eFile').addEventListener('change', function() {
        var file = this.files[0];
        if (file.size > 100000) { // 100kb in bytes
            alert('File size exceeds 1MB. Please choose a smaller file.');
            this.value = ''; // Clear the file input
        }
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</html>