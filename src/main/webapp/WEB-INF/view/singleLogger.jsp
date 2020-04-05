<div class="container">

    <div class="row">
        <div class="mt-3 col-xs-12">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
                <li class="breadcrumb-item"><a
                        href="${contextRoot}/show/all/loggers">Loggers</a></li>
                <li class="breadcrumb-item active">${logger.name}</li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12 col-sm-4">
            <div class="thumbnail">
                <img src="${images}/${logger.code}.jpg" class="img img-responsive" />
            </div>
        </div>

        <div class="col-xs-12 col-sm-8">
            <h4><i class="fas fa-eye"></i>${logger.views}</h4>
            <h2>${logger.name}</h2>
            <hr />
            <p>${logger.description}</p>

            <div class="card" style="background-color: lightskyblue">
                <div class="card-body">
                    <em>Company : </em> ${logger.company}&copy;<br>
                    <em>Year of birth : </em> ${logger.birthYear}<br>
                    <em>Place of birth : </em> ${logger.birthCity}<br>
                    <em>Seniority (years) : </em> ${logger.seniority}<br>
                    <em>Marital status : </em> ${logger.maritalStatus}
                </div>
            </div>
        </div>

        <hr>
        <div class="col-10 my-2">
            <h4>Other viewed loggers</h4>
            <div class="row">
                <c:forEach items="${topLoggers}" var="logger">
                    <div class="col-4 my-2">
                        <div class="card h-100">
                            <a href="${contextRoot}/show/${logger.id}/logger"><img class="card-img-top"
                                                                                     src="${contextRoot}/resources/images/${logger.code}.jpg" alt=""></a>
                            <div class="card-body">
                                <h4 class="card-title">
                                    <a href="${contextRoot}/show/${logger.id}/logger">${logger.name}</a>
                                </h4>
                                <h5>${product.unitPrice}</h5>
                                <p class="card-text">${logger.description}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

</div>