<!--services-->
<div class="services">
    <div class="container">
        <section class="slider">
            <div class="flexslider">
                <ul class="slides">
                    <li>
                        <div class="services-grids">
                            <div class="srvc-img">
                                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                            </div>
                            <h4>Dltrices</h4>
                            <p>Claritas est etiam processus dynaicus qui Mirum est notare quam </p>
                        </div>
                    </li>
                    <li>
                        <div class="services-grids">
                            <div class="srvc-img">
                                <span class="glyphicon glyphicon-camera" aria-hidden="true"></span>
                            </div>
                            <h4>Notareq</h4>
                            <p>Claritas est etiam processus dynaicus qui Mirum est notare quam </p>
                        </div>
                    </li>
                    <li>
                        <div class="services-grids">
                            <div class="srvc-img">
                                <span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
                            </div>
                            <h4>Mirumest</h4>
                            <p>Claritas est etiam processus dynaicus qui Mirum est notare quam </p>
                        </div>
                    </li>
                    <li>
                        <div class="services-grids">
                            <div class="srvc-img">
                                <span class="glyphicon glyphicon-certificate" aria-hidden="true"></span>
                            </div>
                            <h4>Processus</h4>
                            <p>Claritas est etiam processus dynaicus qui Mirum est notare quam </p>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
        <!--FlexSlider-->
        <script defer src="js/jquery.flexslider.js"></script>
        <script type="text/javascript">
            $(window).load(function(){
                $('.flexslider').flexslider({
                    animation: "slide",
                    start: function(slider){
                        $('body').removeClass('loading');
                    }
                });
            });
        </script>
        <!--End-slider-script-->
    </div>
</div>
<!--//services-->