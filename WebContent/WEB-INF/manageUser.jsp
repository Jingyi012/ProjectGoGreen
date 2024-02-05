<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
.pageContent {
	padding: 30px 60px;
}

.pageTitle{
	text-decoration: underline;
    margin: 20px 0;
    font-size: 30px;
    font-weight: bold;
}

/* toast message box */
.statusMessageBox{
    position: fixed;
    bottom: 30px;
    right: 40px;
    background: #fff;
    min-width: 100px;
    min-height: 30px;
    padding: 10px 25px 10px 15px;
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    z-index: 2;
    animation: slideIn 0.5s cubic-bezier(0.68, -0.55, 0.25, 1.35);
}
@keyframes slideIn {
    from {
        transform: translateX(calc(100% + 100px));
    }
    to {
        transform: translateX(0);
    }
}
.statusMessageBox.slideOut{
    animation: slideOut 0.5s cubic-bezier(0.68, -0.55, 0.25, 1.35);
}
@keyframes slideOut{
    from {
        transform: translateX(0);
    }
    to {
        transform: translateX(calc(100% + 100px));
    }
}

.toast-content{
    display: flex;
    justify-content: center;
    align-items: center;
}
.toast-icon{
    display: flex;
    justify-content: center;
    align-items: center;
    height: 35px;
    width: 35px;
    border-radius: 50%;
    color: #fff;
    font-size: 20px;
}
.greenColor{
    background-color: #40f467;
}
.redColor{
    background-color: #f44040;
}
.message{
    display: flex;
    flex-direction: column;
    margin: 0 20px;
}
.message-text{
    font-size: 20px;
    font-weight: 600;
}
.text-1{
    color: #333;
}
.text-2{
    color: #666;
    font-weight: 400;
    font-size: 16px;
}
.toast-close{
    position: absolute;
    top: 10px;
    right: 15px;
    padding: 5px;
    cursor: pointer;
    opacity: 0.7;
}
.toast-close:hover{
    opacity: 1;
}
.progressbar{
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    height: 3px;
    width: 100%;
    /* background-color: #40f467; */
}

.progressbar.active{
    animation: progress 3s linear forwards;
    }
    @keyframes progress {
    100%{
        width: 0%;
    }
}

</style>
</head>
<body>
	<div class="pageContainer">
		<div class="sideBarContainer">
			<jsp:include page="sidebar.jsp" />
		</div>

		<div class="pageWrapper">
			<jsp:include page="headerBar.jsp" />
			<div class="pageContent">
			<c:if test="${not empty approveMessage}">
					<div class='statusMessageBox'>
						<div class='toast-content'>
							<i class='bi bi-check2 toast-icon greenColor'></i>
							<div class='message'>
								<span class='message-text text-1'>Success</span>
								<span class='message-text text-2'>${approveMessage}</span>
							</div>
						</div>
						<i class='bi bi-x toast-close'></i>
						<div class='progressbar active greenColor'></div>
					</div>
				</c:if>
				  <c:if test="${not empty rejectMessage}">
			        <div class='statusMessageBox'>
                            <div class='toast-content'>
                            <i class='bi bi-check2 toast-icon greenColor'></i>
                            <div class='message'>
                                <span class='message-text text-1'>Success</span>
                                <span class='message-text text-2'>${rejectMessage}</span>
                            </div>
                            </div>
                            <i class='bi bi-x toast-close'></i>
                            <div class='progressbar active greenColor'></div>
                    </div>
			    </c:if>
				<div class="pageNav">
					Home > <a href="">Manage User</a>
				</div>
				<div class="content">
					<h2 class="pageTitle">Manage User</h2>

					<form id="form-row">
						<table class="table table-hover">
							<tr class="table-primary">
								<td>No</td>
								<td>Participant</td>
								<td>Validate</td>
							</tr>

							<c:forEach var="user" items="${users}" varStatus="loop">
								<tr>
									<td>${loop.index + 1}</td>
									<td>${user.firstName} ${user.lastName}</td>
									<td><a
										href="${pageContext.request.contextPath}/manageUserProfile?id=${user.id}">
											<i class="bi bi-info-circle validation-icon"></i>

									</a></td>
								</tr>
							</c:forEach>

						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

<script>
	        document.addEventListener('DOMContentLoaded', function() {
	            var statusMessageBox = document.querySelector('.statusMessageBox');
	            if (statusMessageBox) {
	                setTimeout(function() {
	                    statusMessageBox.classList.add("slideOut");
	                }, 3000);
	
	                var progressbar = document.querySelector('.statusMessageBox .progressbar.active');
	                if (progressbar) {
	                    setTimeout(function() {
	                        progressbar.classList.remove("active");
	                        statusMessageBox.remove();
	                    }, 3500);
	                }
	
	                var toastCloseButtons = document.querySelectorAll('.statusMessageBox .toast-close');
	                toastCloseButtons.forEach(function(button) {
	                    button.addEventListener("click", function() {
	                        statusMessageBox.classList.add("slideOut");
	
	                        setTimeout(function() {
	                            progressbar.classList.remove("active");
	                            statusMessageBox.remove();
	                        }, 300);
	                    });
	                });
	            }
	        });

	    </script>
</html>




