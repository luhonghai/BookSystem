<!--footer-->
<div class="footer">
    <div class="container">
        <div class="footer-left">
            <p> © 2015 Stylish. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
        </div>
        <div class="social-icons">
            <ul>
                <li><a href="#" class="fb"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#" class="gg"></a></li>
                <li><a href="#" class="pn"></a></li>
            </ul>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>
<!--//footer-->
<!--smooth-scrolling-of-move-up-->
<script type="text/javascript">
    $(document).ready(function() {
        /*
         var defaults = {
         containerID: 'toTop', // fading element id
         containerHoverID: 'toTopHover', // fading element hover id
         scrollSpeed: 1200,
         easingType: 'linear'
         };
         */

        $().UItoTop({ easingType: 'easeOutQuart' });

    });
</script>
<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<!--//smooth-scrolling-of-move-up-->
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>