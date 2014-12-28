package com.meerkat

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class UnitController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

/**
 * Loads the template responsible to show all given units. If no units are given it shows all of them.
 * @param unitList : List of units to show.
 * @return
 */
    def listUnits(List<Unit> unitList) {
        if (params.unitList == null) unitList = Unit.list(params)
        render(template: 'list', model: ['unitList': unitList, 'numOfResults': unitList.size()])
    }

/**
 * Loads the template responsible to show one unit.
 * @param unitInstance : Unit to show. Can have a value if this function is called like: <g:link action="showUnit" id="${unitInstance.id}">
 * @return
 */
    def showUnit(Unit unitInstance) {
        render(template: 'show', model: ['unitInstance': unitInstance, 'entityName': 'Unit'])
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Unit.list(params), model: [unitInstanceCount: Unit.count()]
    }

    def show(Unit unitInstance) {
        respond unitInstance
    }

    def create() {
        respond new Unit(params)
    }

    @Transactional
    def save(Unit unitInstance) {
        if (unitInstance == null) {
            notFound()
            return
        }

        if (unitInstance.hasErrors()) {
            respond unitInstance.errors, view: 'create'
            return
        }

        unitInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'unit.label', default: 'Unit'), unitInstance.id])
                redirect unitInstance
            }
            '*' { respond unitInstance, [status: CREATED] }
        }
    }

    def edit(Unit unitInstance) {
        respond unitInstance
    }

    @Transactional
    def update(Unit unitInstance) {
        if (unitInstance == null) {
            notFound()
            return
        }

        if (unitInstance.hasErrors()) {
            respond unitInstance.errors, view: 'edit'
            return
        }

        unitInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Unit.label', default: 'Unit'), unitInstance.id])
                redirect unitInstance
            }
            '*' { respond unitInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Unit unitInstance) {

        if (unitInstance == null) {
            notFound()
            return
        }

        unitInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Unit.label', default: 'Unit'), unitInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'unit.label', default: 'Unit'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
