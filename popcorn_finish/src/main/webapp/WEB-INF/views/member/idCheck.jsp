<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_member.jsp"%>

<%
	String id = request.getParameter("id");
	boolean flag = false;
	//dao.duplicateId(id);

	if (flag) {
		out.print("중복되어 사용할 수 없습니다.");
	} else {
		out.print("중복아님, 사용 가능합니다.");
	}
%>