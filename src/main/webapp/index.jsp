<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ht" uri="/WEB-INF/headerTag.tld" %>
<html>
<head>
    <fmt:setLocale value="${sessionScope.lang}"/>
    <fmt:setBundle basename="localization.locale" var="loc"/>
    <fmt:message bundle="${loc}" key="page_title.index" var="pageTitle"/>
    <title>${pageTitle}</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/custom.css">
</head>
<body>
<ht:HeaderTag/>
<c:if test="${not empty message}">
    <div class="alert alert-danger alert-dismissible info-alert" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
        <fmt:message bundle="${loc}" key="message.login.error" var="loginErrorMessage"/>
            ${loginErrorMessage}
    </div>
</c:if>
<c:if test="${not empty successMessage}">
    <div class="alert alert-success alert-dismissible info-alert" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
        <fmt:message bundle="${loc}" key="registration.successful.key" var="successMsg"/>
            ${successMsg}
    </div>
</c:if>

<div class="jumbotron">
    <div class="container">
        <fmt:message bundle="${loc}" key="home.welcome" var="welcome"/>
        <h1>${welcome}</h1>
        <fmt:message bundle="${loc}" key="home.page.text" var="homePageText"/>
        <p>${homePageText}</p>
        <fmt:message bundle="${loc}" key="home.description" var="description"/>
        <h2>${description}</h2>
    </div>

    <c:if test="${sessionScope.user != null}">
        <div class="container">
            <form action="/order" method="post">
                <fmt:message bundle="${loc}" key="home.bookTitle" var="bookTitle"/>
                <h2>${bookTitle}</h2>

                <fmt:message bundle="${loc}" key="order.form.beds.label" var="form_BedsLabel"/>
                <label>${form_BedsLabel}</label>
                <select name="beds" class="form-control">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                </select>

                <fmt:message bundle="${loc}" key="order.form.class.label" var="form_classLabel"/>
                <label>${form_classLabel}</label>
                <select name="stars" class="form-control">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>


                <fmt:message bundle="${loc}" key="order.form.check_in.label" var="form_checkInLabel"/>
                <label>${form_checkInLabel}</label>
                <input type="date" name="checkIn" class="form-control">

                <fmt:message bundle="${loc}" key="order.form.check_out.label" var="form_checkOutLabel"/>
                <label>${form_checkOutLabel}</label>
                <input type="date" name="checkOut" class="form-control">

                <fmt:message bundle="${loc}" key="order.form.comments.label" var="form_commentsLabel"/>
                <label>${form_commentsLabel}</label>
                <textarea rows="3" name="comments" class="form-control"></textarea>

                <fmt:message bundle="${loc}" key="order.form.pastdate.alert" var="form_pastDateAlert"/>
                <div class="alert alert-warning" role="alert" style="display:none" id="date in past">${form_pastDateAlert}</div>

                <fmt:message bundle="${loc}" key="order.form.notvaliddates.alert" var="form_notValidDatesAlert"/>
                <div class="alert alert-warning" role="alert" style="display:none" id="dates not valid">${form_notValidDatesAlert}</div>

                <fmt:message bundle="${loc}" key="order.form.nodates.alert" var="form_noDatesAlertcommentsLabel"/>
                <div class="alert alert-warning" role="alert" style="display:none" id="empty dates">${form_noDatesAlertcommentsLabel}</div>

                <br/>
                <fmt:message bundle="${loc}" key="button.order_page" var="btn_orderPage"/>

                <button type="button" class="btn btn-success"
                        onclick="checkDates(this.parentNode)">${btn_orderPage}</button>

                <div class="alert alert-success" role="alert" style="display:none" id="success">The order was successful. Thank you.</div>

                <button type="submit" class="btn btn-success" id="submitBtn"
                        style="display: none;">${btn_orderPage}</button>
            </form>
        </div>
        <c:if test="${fn:length(userRequests) gt 0}">
            <div class="container">
                <%@include file="jsp/userRequestList.jsp"%>
                <%--<jsp:include page="jsp/userRequestList.jsp"/>--%>
            </div>
        </c:if>
    </c:if>
</div>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"
        integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
        crossorigin="anonymous">
</script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/custom.js"></script>
</body>
</html>