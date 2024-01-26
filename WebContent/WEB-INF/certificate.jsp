<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen Certificate</title>
<style>
.pageContent {
	padding: 30px 60px;
}

.hero {
	position: relative;
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
            font-family: 'Poppins', sans-serif;
            padding-top: 0px; /* Increased padding for a larger frame */
            width: 80%;
            max-width: 650px; /* Increased max-width for a larger frame */
            text-align: center;
            margin: 30px auto; 
}

.hero img {
	width: 100%;
	height: auto;
	display: block;
	margin: 0 auto;
}

.certificate-text {
    position: absolute;
    top: 45%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: #161A30;
    font-size: 18px; 
    font-weight: center;
    z-index: 1;
    width: 100%;
}

.certificate-text h2 {
	font-size: 80px;
	margin-bottom: 0;
	padding-top: 0;
	margin-top: 0;
	line-height: 1;
}

.certificate-text h1 {
	font-size: 28px;
}

.certificate-text .bold {
	font-weight: bold;
	display: inline-block;
	font-size: 24px;
	padding-bottom: 15px;
	margin-bottom: 20px;
}

.certificate-text h6 {
	font-size: 12px;
	font-weight: normal;
	padding-bottom: 30px;
}

#btn {
	text-decoration: none;
	padding: 15px;
	background-color: #f2bc85;
	color: white;
	border-radius: 15px;
	border: none;
	cursor: pointer;
}

#btn:hover {
	border: black solid 0.5px;
}

.download {
	text-align: center;
}

#content {
	text-align: center;
	margin: 50px auto;
}

#downloadBtn {
	padding: 10px 20px;
	background-color: #3498db;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.calendarYear {
	text-align: center;
	margin: 10px 0 20px 0;
	cursor: pointer;
	font-size: 20px;
}

#yearSelect {
	font-size: 20px;
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
				<div class="pageNav">
					Home > <a href="${pageContext.request.contextPath}/certificate">Certificate</a>
				</div>
					<div id="calendarYear" class="calendarYear">
						<i class="bi bi-caret-left-fill" class="carousel-control-prev" type="button" data-bs-target="#calendarContainer" data-bs-slide="prev"></i> 
						<select id="yearSelect">
							<option>2021</option>
							<option>2022</option>
							<option selected>2023</option>
						</select> <i class="bi bi-caret-right-fill"></i>
					

				</div>

				<div class="hero" id="hero">

	
				</div>
			</div>
		</div>
		
		<script
			src="https://rawgit.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js"></script>
		<script>
			function downloadPDF() {
				var element = document.querySelector('.hero');

				html2pdf(element, {
					margin : 10,
					filename : 'Certificate.pdf',
					image : {
						type : 'jpeg',
						quality : 0.98
					},
					html2canvas : {
						scale : 2
					},
					jsPDF : {
						unit : 'mm',
						format : 'a4',
						orientation : 'portrait'
					}
				});
			}
		</script>
<script>
$(document).ready(function () {
    updateCalendar(2023);

    $('#yearSelect').change(function () {
        updateCalendar($(this).val());

        
    });

    $('.bi-caret-left-fill').click(decrementSelect);
    $('.bi-caret-right-fill').click(incrementSelect);

    function updateCalendar(year) {
        $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/certificate/updatecertificate',
            data: {
                year: year
            },
            success: function (response) {
    
                $('#hero').html(response);
                $('#hero').hide().fadeIn(500);
            },
            error: function (error) {
                console.error('Error updating included page:', error);
            }
        });
    }
    function incrementSelect() {
        var select = $('#yearSelect');
        var newIndex = Math.min(select[0].options.length - 1, select.prop('selectedIndex') + 1);
        if (newIndex !== select.prop('selectedIndex')) {
            select.prop('selectedIndex', newIndex);
            updateCalendar(select.val());
        }
    }

    function decrementSelect() {
        var select = $('#yearSelect');
        var newIndex = Math.max(0, select.prop('selectedIndex') - 1);
        if (newIndex !== select.prop('selectedIndex')) {
            select.prop('selectedIndex', newIndex);
            updateCalendar(select.val());
        }
    }
});
</script>
</div>
</body>
</html>
