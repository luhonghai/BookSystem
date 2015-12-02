<%@attribute name="pageTitle" required="true" %>
<title><%=pageTitle%></title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Stylish Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<link href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="<%=request.getContextPath()%>/css/style.css" type="text/css" rel="stylesheet" media="all">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/flexslider.css" type="text/css" media="screen" />
<script>
    var CONTEXT_PATH ="<%=request.getContextPath()%>";
</script>
<!-- js -->
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<!-- start-smoth-scrolling-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/move-top.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easing.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function($) {
        $(".scroll").click(function(event){
            event.preventDefault();
            $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
        });
    });
</script>
<!--//end-smoth-scrolling-->
<!--pop-up-->
<script src="<%=request.getContextPath()%>/js/menu_jquery.js"></script>
<!--//pop-up-->