%{--This should create the Footer of the website--}%
<footer class="palette-wet-asphalt">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12" align="center">
                <g:set var="currentYear" value="${new Date()[Calendar.YEAR]}"/>
                <h6 class="footer-title"><g:link base="http://www.meerkat.gr" target="_blank">Meerkat</g:link> &copy  All Rights Reserved ${currentYear} <br/>
                    <g:link base="https://www.facebook.com/meerkat.gr?ref=ts&fref=ts" target="_blank"><span class="fui-facebook"></span></g:link>
                    <g:link base="https://twitter.com/meerkat_team"><span class="fui-twitter"></span></g:link>
                </h6>
            </div>
        </div>
    </div>
</footer>
