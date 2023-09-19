<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./assets/css/universe.css" />
<link rel="stylesheet" href="./assets/css/user_login.css">
<link rel="stylesheet" href="./assets/css/index.css" />
<link rel="stylesheet" href="./assets/css/architect_apply_form.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<style type="text/css">
textarea {
	overflow: auto;
	resize: vertical;
	font-size: small;
	margin-left: -7px;
	width: 450px;
	height: auto;
}

#onlyreg {
	width: 548px;
	font-size: 17px;
}

#small {
	font-size: 18px;
	padding: 5px;
	border-radius: 7px;
	float: right;
}
</style>
<title>Create Design</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="main-container">
		<div>
			<form action="createDesign" method="post" id="form2" id="onlyreg"
				class="onlyreg">
				<label>Architect Id : *</label> <input id="small" type="number"
					name="architectId" placeholder="Enter architectId "
					value="${architectId}" required /> <br /> <br /> <label>Name:
					*</label> <input id="small" type="text" name="name"
					placeholder="Enter design name" value="${name}" required /> <br />
				<br /> <label>Style:</label> <input type="text" id="small"
					placeholder="style of the design" name="style" value="${style}" />
				<br /> <br /> <label> Square feet: *</label> <input type="number"
					id="small" placeholder="1213" name="sqft" required
					value="${squarefeet}" /> <br /> <br /> <label>Price per
					sq/ft: *</label> <input type="number" id="small" name="priceppersqft"
					required value="${priceppersqft}" /> <br /> <br /> <label
					for="category">Category: *</label> <input list="categorys"
					id="small" required name="category" value="${category}">
				<datalist id="browsers">
					<option value="Bedroom">
					<option value="Livingroom">
					<option value="Kitchen">
					<option value="Bathroom">
					<option value="others">
				</datalist>
				<br /> <br /> <label for="floorplan">Floor plan: *</label> <input
					list="plans" required name="floorplan" id="small"
					value="${floorplan}">
				<datalist id="browsers">
					<option value="1BHK">
					<option value="2BHK">
					<option value="3BHK">
					<option value="3+BHK">
					<option value="others">
				</datalist>
				<br /> <br /> <label>Required months:</label> <input type="number"
					id="small" placeholder="3" name="timerequired"
					value="${timerequired}" /> <br /> <br /> <label>Bio
					about the design: *</label>
				<textarea type="text" pattern="{45,180}" name="bio" value="${bio}"
					required
					title="bio contain more than 45 letter and less than 180 letter"
					id="paragraph">Modern bedrooms often feature minimalistic design principles.Clutter is minimized,essential furniture and decor items are used. </textarea>
				<br /> <br /> <label>Brief about the design:* </label>
				<textarea type="text" id="brief_paragraph" required name="brief"
					value="${brief}"> The space is kept uncluttered and free from excessive ornamentation.</textarea>
				<br /> <br />

				<div class="container my-4">
					<div class="card my-4 shadow">
						<div class="card-body">
							<div id="dynamic-field-1" class="form-group dynamic-field">
								<label for="field" class="font-weight-bold">Image 1 *</label> <input
									type="text" id="small" class="form-control" required
									name="field[]" />
								<!-- Add a hidden input field for the image value -->
								<input type="hidden" name="imageValue[]" />
							</div>
							<div class="clearfix mt-4">
								<button type="button" id="add-button"
									class="btn btn-secondary float-left text-uppercase shadow-sm">
									<i class="fas fa-plus fa-fw"></i> Add
								</button>
								<button type="button" id="remove-button"
									class="btn btn-secondary float-left text-uppercase ml-1"
									disabled="disabled">
									<i class="fas fa-minus fa-fw"></i> Remove
								</button>
							</div>
						</div>
					</div>

				</div>

				<div>
					<button class="signup" type="submit">Add Design</button>
				</div>
			</form>
		</div>
	</div>


	<script>
		$(document).ready(
				function() {
					var buttonAdd = $("#add-button");
					var buttonRemove = $("#remove-button");
					var className = ".dynamic-field";
					var count = 0;
					var field = "";
					var maxFields = 100;

					function totalFields() {
						return $(className).length;
					}

					function addNewField() {
						count = totalFields() + 1;
						field = $("#dynamic-field-1").clone();
						field.attr("id", "dynamic-field-" + count);
						field.children("label").text("Image " + count);
						field.find("input").val("");

						// Update the hidden input field's name attribute
						field.find("input[type='hidden']").attr("name",
								"imageValue[" + (count - 1) + "]");

						$(className + ":last").after($(field));
					}

					function removeLastField() {
						if (totalFields() > 1) {
							$(className + ":last").remove();
						}
					}

					function enableButtonRemove() {
						if (totalFields() === 2) {
							buttonRemove.removeAttr("disabled");
							buttonRemove.addClass("shadow-sm");
						}
					}

					function disableButtonRemove() {
						if (totalFields() === 1) {
							buttonRemove.attr("disabled", "disabled");
							buttonRemove.removeClass("shadow-sm");
						}
					}

					function disableButtonAdd() {
						if (totalFields() === maxFields) {
							buttonAdd.attr("disabled", "disabled");
							buttonAdd.removeClass("shadow-sm");
						}
					}

					function enableButtonAdd() {
						if (totalFields() === (maxFields - 1)) {
							buttonAdd.removeAttr("disabled");
							buttonAdd.addClass("shadow-sm");
						}
					}

					buttonAdd.click(function() {
						addNewField();
						enableButtonRemove();
						disableButtonAdd();
					});

					buttonRemove.click(function() {
						removeLastField();
						disableButtonRemove();
						enableButtonAdd();
					});
				});
	</script>
</body>
</html>
