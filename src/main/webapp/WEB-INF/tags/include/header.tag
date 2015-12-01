<%@attribute name="index"%>
<!--header-->
<div class="header">
    <div class="container">
        <div class="header-left">
            <ul>
                <li><a href="<%=request.getContextPath()%>/account.jsp">ACCOUNT</a></li>
                <li class="login" >
                    <div id="loginContainer"><a href="#" id="loginButton"><span>LOGIN</span></a>
                        <div id="loginBox">
                            <form id="loginForm">
                                <fieldset id="body">
                                    <fieldset>
                                        <label for="email">Email Address</label>
                                        <input type="text" name="email" id="email">
                                    </fieldset>
                                    <fieldset>
                                        <label for="password">Password</label>
                                        <input type="password" name="password" id="password">
                                    </fieldset>
                                    <input type="submit" id="login" value="Sign in">
                                    <label for="checkbox"><input type="checkbox" id="checkbox"> <i>Remember me</i></label>
                                </fieldset>
                                <span><a href="#">Forgot your password?</a></span>
                            </form>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="logo">
            <a href="<%=request.getContextPath()%>/"> <img src="<%=request.getContextPath()%>/images/logo.png" alt=""/></a>
        </div>
        <div class="top-nav">
            <span class="menu"><img src="<%=request.getContextPath()%>/images/menu.png" alt=""/></span>
            <ul>
                <li><a <%=(index != null && index.equalsIgnoreCase("0") ? "class=\"active\"" : "")%> href="<%=request.getContextPath()%>/">Home</a></li>
                <li><a <%=(index != null && index.equalsIgnoreCase("1") ? "class=\"active\"" : "")%>href="<%=request.getContextPath()%>/about.jsp">About</a></li>
                <li><a <%=(index != null && index.equalsIgnoreCase("2") ? "class=\"active\"" : "")%>href="<%=request.getContextPath()%>/gallery.jsp">Gallery</a></li>
                <li><a <%=(index != null && index.equalsIgnoreCase("3") ? "class=\"active\"" : "")%>href="<%=request.getContextPath()%>/news.jsp">News</a></li>
                <li><a <%=(index != null && index.equalsIgnoreCase("4") ? "class=\"active\"" : "")%>href="<%=request.getContextPath()%>/codes.jsp">Codes</a></li>
                <li><a <%=(index != null && index.equalsIgnoreCase("5") ? "class=\"active\"" : "")%>href="<%=request.getContextPath()%>/contact.jsp">Contact</a></li>
            </ul>
            <!-- script-for-menu -->
            <script>
                $("span.menu").click(function(){
                    $(".top-nav ul").slideToggle("slow" , function(){
                    });
                });
            </script>
            <!-- script-for-menu -->
        </div>
        <div class="search-box">
            <div id="sb-search" class="sb-search">
                <form>
                    <input class="sb-search-input" placeholder="search term..." type="search" name="search" id="search">
                    <input class="sb-search-submit" type="submit" value="">
                    <span class="sb-icon-search"> </span>
                </form>
            </div>
        </div>
        <div class="clearfix"> </div>
        <!-- search-scripts -->
        <script src="<%=request.getContextPath()%>/js/classie.js"></script>
        <script src="<%=request.getContextPath()%>/js/uisearch.js"></script>
        <script>
            new UISearch( document.getElementById( 'sb-search' ) );
        </script>
        <!-- //search-scripts -->
    </div>
</div>
<!--//header-->