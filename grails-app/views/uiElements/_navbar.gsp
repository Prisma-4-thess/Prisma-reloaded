%{--This should create the Navbar of the website--}%
<!-- Static navbar -->
<nav class="navbar-default palette-silver">
    <div class="container-fluid">
        <div class="navbar-header ">
            %{--<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>--}%
            <g:link  url="${createLink(uri: '/')}"><asset:image src="site-logo.png" alt="Prisma logo"/></g:link>

        </div>
       %{-- <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="./">Default <span class="sr-only">(current)</span></a></li>
                <li><a href="../navbar-static-top/">Static top</a></li>
                <li><a href="../navbar-fixed-top/">Fixed top</a></li>
            </ul>
        </div><!--/.nav-collapse -->--}%
    </div><!--/.container-fluid -->
</nav>