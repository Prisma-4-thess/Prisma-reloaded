package com.meerkat

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class GeoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    /**
     * Loads the template responsible to show all given geos. If no geos are given it shows all of them.
     * @param geoList : List of geos to show.
     * @return
     */
    def listGeos(List<Geo> geoList) {
//        if (params.geoList == null) geoList = Geo.list(params)
        render(template: 'list', model: ['geoList': geoList, 'numOfResults': Geo.count()])
    }

    /**
     * Loads the template responsible to show one geo.
     * @param geoInstance : Geo to show. Can have a value if this function is called like: <g:link action="showGeo" id="${geoInstance.id}">
     * @return
     */
    def showGeo(Geo geoInstance) {
        render(template: 'show', model: ['geoInstance': geoInstance, 'entityName': 'Geo'])
    }

    /**
     * Get geo ids that need to be loaded to the map.
     * @param geoList :
     */
    def listGeosFromMap() {
        List<Geo> geoList;
        def geoIds = params.ids.toString().split(",")
        geoIds.each { g ->
            geoList.add(Geo.findById(g.toLong()))
        }
        listGeos(geoList)
    }

    /**
     * Renders template to show the decisions of a geo
     * @return geoInstance: Geo to show its decisions
     */
    def showDecisionsOfGeo(Geo geoInstance) {
        if(params.geoId) {
            geoInstance = Geo.get(params.long('geoId'))
        }
        def decisionList = geoInstance.decisions
        println(decisionList)
        render(template: 'geo_decisions_list', model: ['geoInstance': geoInstance, 'decisionList': decisionList])
    }
    /**
     * Gets nearby geos and load the template to show them
     * @param lat : latitude
     * @param lon : longitude
     * @return geoList: List of Geo
     */
    def showNearbyGeo(double lat, double lon, double radius, int max) {

        if (params.radius == null) radius = getGrailsApplication().getConfig().geo.nearby.radius.toDouble()

        if (params.max == null) max = getGrailsApplication().getConfig().geo.nearby.max.toDouble()

        def geoList = GeoService.findPOINearLatLng(lat, lon, radius, max)

        render(template: 'nearby_geo_tagList', model: ['geoList': geoList, 'numOfResults': geoList.size()])
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Geo.list(params), model: [geoInstanceCount: Geo.count()]
    }

    def show(Geo geoInstance) {
        respond geoInstance
    }

    def create() {
        respond new Geo(params)
    }

    @Transactional
    def save(Geo geoInstance) {
        if (geoInstance == null) {
            notFound()
            return
        }

        if (geoInstance.hasErrors()) {
            respond geoInstance.errors, view: 'create'
            return
        }

        geoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'geo.label', default: 'Geo'), geoInstance.id])
                redirect geoInstance
            }
            '*' { respond geoInstance, [status: CREATED] }
        }
    }

    def mapTest(){

    }

    def edit(Geo geoInstance) {
        respond geoInstance
    }

    @Transactional
    def update(Geo geoInstance) {
        if (geoInstance == null) {
            notFound()
            return
        }

        if (geoInstance.hasErrors()) {
            respond geoInstance.errors, view: 'edit'
            return
        }

        geoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Geo.label', default: 'Geo'), geoInstance.id])
                redirect geoInstance
            }
            '*' { respond geoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Geo geoInstance) {

        if (geoInstance == null) {
            notFound()
            return
        }

        geoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Geo.label', default: 'Geo'), geoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'geo.label', default: 'Geo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

}
