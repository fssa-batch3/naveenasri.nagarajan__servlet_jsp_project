<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.*" %>

        <%@page import="com.fssa.dynamicdesign.service.exception.ServiceException" %>
            <%@ page import="com.fssa.dynamicdesign.service.*" %>
                <%@ page import="com.fssa.dynamicdesign.model.*" %>
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
                        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
                            integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
                            crossorigin="anonymous" />
                        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                            crossorigin="anonymous"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
                            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                            crossorigin="anonymous"></script>
                        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
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
							input {
				width: 222px;
			}
                            select {
                                text-transform: none;
                                margin-left: 130px;
                                width: 47.5%;
                                border: green;
                                font-size: 18px;
                                height: 40px;
                            }

                            #floorPlan {
                                margin-left: 119px;
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
                        <title>Edit Design</title>
                    </head>

                    <body>
                        <jsp:include page="header.jsp"></jsp:include>

                        <div>
                            <% long uniqueId=Long.parseLong(request.getParameter("uniqueId")); DesignService
                                designService=new DesignService(); List<Design> listDesigns =
                                designService.getDesignByUniqueId(uniqueId);
                                System.out.println(listDesigns);

                                System.out.println(listDesigns.get(0).getDesignUrls());
                                Design design = listDesigns.get(0);
                                %>

                        </div>

                        <form action="DesignEditServlet?uniqueId=<%=uniqueId%>" method="post" id="form2"
                            class="onlyreg">

                            <!-- error message pop up  -->
                            <% String errorMessage=request.getParameter("error"); if (errorMessage !=null) { %>
                                <div class="styledbutton">
                                    <%=errorMessage%>
                                </div>
                                <br /> <br />
                                <% } %>

                                    <label for="designName">Design Name:</label>
                                    <input type="text" id="small" name="designName"
                                        value="<%= design.getDesignName() %>" required /><br /><br />

                                    <label for="style">Style:</label>
                                    <input type="text" id="small" name="style"
                                        value="<%= design.getStyle() %>" /><br /><br />

                                    <label for="sqft">Square Feet:</label>
                                    <input type="number" id="small" min="10" max="99999" name="sqft"
                                        value="<%= design.getSquareFeet()%>" required /><br /><br />

                                    <label>Price per sq/ft: *</label>
                                    <input type="number" min="1" max="999" id="small" name="priceppersqft" required
                                        value="<%= design.getPricePerSqFt()%>" /><br /><br />

                                    <label for="category">Category:</label>
                                    <select id="category" name="category" id="small">
                                        <option value="Bedroom" <%=design.getCategory().equals("Bedroom") ? "selected"
                                            : "" %>>Bedroom</option>
                                        <option value="Livingroom" <%=design.getCategory().equals("Livingroom")
                                            ? "selected" : "" %>>Livingroom</option>
                                        <option value="Kitchen" <%=design.getCategory().equals("Kitchen") ? "selected"
                                            : "" %>>Kitchen</option>
                                        <option value="Bathroom" <%=design.getCategory().equals("Bathroom") ? "selected"
                                            : "" %>>Bathroom</option>
                                        <option value="others" <%=design.getCategory().equals("others") ? "selected"
                                            : "" %>>Others</option>
                                    </select><br /><br />

                                    <label for="floorPlan">Floor Plan:</label>
                                    <select id="floorPlan" name="floorPlan" id="small">
                                        <option value="1BHK" <%=design.getFloorPlan().equals("1BHK") ? "selected" : ""
                                            %>>1BHK</option>
                                        <option value="2BHK" <%=design.getFloorPlan().equals("2BHK") ? "selected" : ""
                                            %>>2BHK</option>
                                        <option value="3BHK" <%=design.getFloorPlan().equals("3BHK") ? "selected" : ""
                                            %>>3BHK</option>
                                        <option value="3+BHK" <%=design.getFloorPlan().equals("3+BHK") ? "selected" : ""
                                            %>>3+BHK</option>
                                        <option value="others" <%=design.getFloorPlan().equals("others") ? "selected"
                                            : "" %>>Others</option>
                                    </select><br /><br />

                                    <label for="timeRequired">Required months:</label>
                                    <input type="number" min="1" max="60" id="small" name="timeRequired"
                                        value="<%= design.getTimeRequired() %>" required /><br /><br />

                                    <label for="bio">Bio about the design:</label>
                                    <textarea id="small" name="bio"
                                        required><%= design.getBio() %></textarea><br /><br /><br /><br />

                                    <label for="brief">Brief about the design:</label>
                                    <textarea id="small" name="brief"
                                        required><%= design.getBrief() %></textarea><br /><br /><br /><br />


                                    <div class="container my-4">
                                        <div class="card my-4 shadow">
                                            <div class="card-body">

                                                <% List<String> designUrls = new ArrayList<>();
                                                        designUrls = design.getDesignUrls();

                                                        for (String i : designUrls){
                                                        %>

                                                        <div id="dynamic-field-1" class="form-group dynamic-field">
                                                            <label for="field" class="font-weight-bold">Image 1
                                                                *</label>
                                                            <input type="text" id="field" class="form-control" required
                                                                name="field[]" value="<%=i%>" />
                                                            <!-- Add a hidden input field for the image value -->
                                                            <input type="hidden" name="imageValue[]" />
                                                        </div>

                                                        <%} %>
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
                                        <button class="signup" type="submit">Update Design</button>
                                    </div>
                        </form>

                        <script>
                            $(document).ready(function () {
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
                                    field.find("input[type='hidden']").attr("name", "imageValue[" + (count - 1) + "]");

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

                                buttonAdd.click(function () {
                                    addNewField();
                                    enableButtonRemove();
                                    disableButtonAdd();
                                });

                                buttonRemove.click(function () {
                                    removeLastField();
                                    disableButtonRemove();
                                    enableButtonAdd();
                                });
                            });
                        </script>
                    </body>

                    </html>