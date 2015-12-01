<!--banner-->
<div class="banner">
    <!-- banner-text Slider starts Here -->
    <script src="js/responsiveslides.min.js"></script>
    <script>
        // You can also use "$(window).load(function() {"
        $(function () {
            // Slideshow 3
            $("#slider3").responsiveSlides({
                auto: true,
                pager:true,
                nav:true,
                speed: 500,
                namespace: "callbacks",
                before: function () {
                    $('.events').append("<li>before event fired.</li>");
                },
                after: function () {
                    $('.events').append("<li>after event fired.</li>");
                }
            });
        });
    </script>
    <!--//End-slider-script -->
    <div  id="top" class="callbacks_container">
        <ul class="rslides" id="slider3">
            <li>
                <div class="banner1">
                </div>
            </li>
            <li>
                <div class="banner1 banner2">
                </div>
            </li>
            <li>
                <div class="banner1 banner3">
                </div>
            </li>
        </ul>
        <div class="clearfix"> </div>
    </div>
</div>
<!--//banner-->