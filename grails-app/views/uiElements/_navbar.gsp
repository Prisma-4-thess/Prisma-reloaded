%{--This should create the Navbar of the website--}%

<nav class="navbar navbar-default customNavbar" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <g:link  url="${createLink(uri: '/')}"><asset:image src="site-logo.png" alt="Prisma logo"/></g:link>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Default</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact us</a></li>
            </ul>
        </div>
    </div>
</nav>