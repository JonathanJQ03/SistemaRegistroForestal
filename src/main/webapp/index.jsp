<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<% 
    // redirige TODO lo que llegue a “/” hacia /Tree
    response.sendRedirect(request.getContextPath() + "/Tree");
    return; // ¡muy importante! detiene el procesamiento de la JSP
%>