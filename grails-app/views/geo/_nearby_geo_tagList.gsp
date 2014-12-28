<g:if test="${numOfResults.toInteger() != 0}">
    <g:if test="${numOfResults.toInteger() < 5}">
        <div class="col-md-2 tagList">
            <g:render template="nearby_geo" model="['geoList': geoList[0..numOfResults - 1]]"/>
        </div>
    </g:if>
    <g:else>
        <div class="col-md-2 tagList">
            <g:render template="nearby_geo" model="['geoList': geoList[0..4]]"/>
        </div>

        <div class="col-md-2 tagList">
            <g:render template="nearby_geo" model="['geoList': geoList[5..numOfResults - 1]]"/>
        </div>
    </g:else>
</g:if>