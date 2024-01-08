<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
<script>
	    function downloadPdf() {
	        const element = document.getElementById('reportContainer'); // Replace with the ID of your HTML container
	        const opt = {
       		margin: 1,
       		  filename: 'electricReport_${month}_${year}.pdf',
       		  image: { type: 'jpeg', quality: 0.98 },
       		  jsPDF: { unit: 'mm', format: 'A4', orientation: 'portrait' }
       		};
	
	        html2pdf().set(opt).from(element).save();
	    }
	</script>
</html>