<%
  String msg1 = (String)session.getAttribute("message");
  if(msg1!=null){
      
      
     
      
      
      
%>

<div style="font-size:20px;" class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong><%= msg1 %></strong> 
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

<%    
      session.removeAttribute("message");
  }
  




%>
