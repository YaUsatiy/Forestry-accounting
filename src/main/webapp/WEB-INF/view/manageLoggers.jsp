<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<div class="container">

    <c:if test="${not empty message}">
        <div class="mt-3 row">
            <div class="col-12">
                <div class="alert alert-success" role="alert">${message}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </div>
        </div>
    </c:if>

    <div class="row">
        <div class="col-12">
            <div class="my-3 card">
                <div class="card-header">
                    <h4>Loggers Management</h4>
                </div>
                <div class="card-body">
                    <sf:form class="form" modelAttribute="logger" action="${contextRoot}/manage/loggers" method="POST" enctype="multipart/form-data">
<%--                        <div class="form-row mb-3">--%>
<%--                            <label class="col-form-label col-4">Id</label>--%>
<%--                            <div class="col-8">--%>
<%--                                <sf:input type="number" path="id" class="form-control"--%>
<%--                                          placeholder="id" />--%>
<%--                                <sf:errors path="id" cssClass="help-block" element="em"/>--%>
<%--                            </div>--%>
<%--                        </div>--%>

                        <div class="form-row mb-3">
                            <label class="col-form-label col-4">Name</label>
                            <div class="col-8">
                                <sf:input type="text" path="name" class="form-control"
                                          placeholder="Product Name" />
                                <sf:errors path="name" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-row mb-3">
                            <label class="col-form-label col-4">Company</label>
                            <div class="col-8">
                                <sf:input type="text" path="company" class="form-control"
                                          placeholder="Logger company" />
                                <sf:errors path="company" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-row mb-3">
                            <label class="col-form-label col-4">Description</label>
                            <div class="col-8">
                                <sf:textarea path="description" class="form-control"
                                             placeholder="Enter description of logger here!" />
                                <sf:errors path="description" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-row mb-3">
                            <label class="col-form-label col-4">Place of birth</label>
                            <div class="col-8">
                                <sf:input type="text" path="birthCity" class="form-control"
                                             placeholder="Enter place of birth!" />
                                <sf:errors path="birthCity" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-row mb-3">
                            <label class="col-form-label col-4">Year of birth</label>
                            <div class="col-8">
                                <sf:input type="number" path="birthYear" class="form-control"
                                          placeholder="Enter year of birth" />
                                <sf:errors path="birthYear" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-row mb-3">
                            <label class="col-form-label col-4">Year of seniority</label>
                            <div class="col-8">
                                <sf:input type="number" path="seniority" class="form-control"
                                          placeholder="Enter year of seniority" />
                                <sf:errors path="seniority" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-row mb-3">
                            <label class="col-form-label col-4">Marital Status</label>
                            <div class="col-8">
                                <sf:input type="text" path="maritalStatus" class="form-control"
                                           placeholder="Enter Marital Status!" />
                                <sf:errors path="maritalStatus" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-row mb-3">
                            <label class="col-form-label col-4">Upload a file</label>
                            <div class="col-md-8">
                                <sf:input type="file" path="file" class="form-control"/>
                                <sf:errors path="file" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <sf:hidden path="id"/>

                        <div class="form-row">
                            <div class="offset-4 col-4">
                                <input type="submit" name="submit" value="Save" class="btn btn-primary"/>
                            </div>
                        </div>

                    </sf:form>
                </div>
            </div>
        </div>
    </div>

    <hr/>
    <h1>Available Loggers</h1>
    <hr/>

    <div class="row">
        <div class='col-12'>
            <div class="table-responsive-xl">
                <table id="loggersListTable" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th></th>
                        <th>Name</th>
                        <th>Seniority</th>
                        <th>Company</th>
                        <th>Edit</th>
                    </tr>
                    </thead>
                </table><br/>
            </div>
        </div>
    </div>

</div>