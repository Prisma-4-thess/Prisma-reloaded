package com.meerkat

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class DecisionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    /**
     * Page to add geo to decision
     * @return
     */
    def showAddGeo() {
        //def geoList = GeoService.findPOINearLatLng(params.lat, params.lon, getGrailsApplication().getConfig().geo.nearby.radius.toInteger())
        return
    }

    /**
     * Adds a geo to a decision
     * @param max
     * @return
     */
    def addGeo() {
        print 'Ela mpika'
        render(template: 'add_geo_success')
        //TODO: Add geo to decision an load the correct template for success or fail
    }

    /**
     * Loads the template responsible to show all given decisions. If no decisions are given it shows all of them.
     * @param decList : List of decisions to show.
     * @return
     */
    def listDecisions(List<Decision> decList) {
        if (params.decList == null) decList = Decision.list(params)
        render(template: 'list', model: ['decList': decList, 'numOfResults': decList.size()])
    }

/**
 * Loads the template responsible to show one decision.
 * @param decInstance : Decision to show. Can have a value if this function is called like: <g:link action="showDecision" id="${decInstance.id}">
 * @return
 */
    def showDecision(Decision decInstance) {
        render(template: 'show', model: ['decInstance': decInstance, 'entityName': 'Decision'])
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Decision.list(params), model: [decisionInstanceCount: Decision.count()]
    }

    def show(Decision decisionInstance) {
        respond decisionInstance
    }

    def create() {
        respond new Decision(params)
    }

    @Transactional
    def save(Decision decisionInstance) {
        if (decisionInstance == null) {
            notFound()
            return
        }

        if (decisionInstance.hasErrors()) {
            respond decisionInstance.errors, view: 'create'
            return
        }

        decisionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'decision.label', default: 'Decision'), decisionInstance.id])
                redirect decisionInstance
            }
            '*' { respond decisionInstance, [status: CREATED] }
        }
    }

    def edit(Decision decisionInstance) {
        respond decisionInstance
    }

    @Transactional
    def update(Decision decisionInstance) {
        if (decisionInstance == null) {
            notFound()
            return
        }

        if (decisionInstance.hasErrors()) {
            respond decisionInstance.errors, view: 'edit'
            return
        }

        decisionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Decision.label', default: 'Decision'), decisionInstance.id])
                redirect decisionInstance
            }
            '*' { respond decisionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Decision decisionInstance) {

        if (decisionInstance == null) {
            notFound()
            return
        }

        decisionInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Decision.label', default: 'Decision'), decisionInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'decision.label', default: 'Decision'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
