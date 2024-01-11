<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<div class="detailItemBlock">
		<p>Water Consumption</p>
		<span class="consumption water"> <i class="bi bi-droplet"></i>
			<span> 208 L</span>
		</span>
	</div>
	<div class="detailItemBlock">
		<p>Electric Consumption</p>
		<span class="consumption electric"> <i
			class="bi bi-lightning-charge"></i> <span> 208 kWh</span>
		</span>
	</div>
	<div class="detailItemBlock recycle">
		<p>Recycle Weight</p>
		<span class="consumption recycle"> <i class="bi bi-recycle"></i>
			<span> 208 kg</span>
		</span>
	</div>
	<div class="detailItemBlock carbonFootprint">
		<p>Carbon Footprint</p>
		<span class="consumption"> <img
			src="${pageContext.request.contextPath}/resources/images/carbonFootprint.png"
			alt="carbonFootprint.png" width="30px" /> <span>120 kgCO<sub>2</sub></span>
		</span>
	</div>
</body>
</html>