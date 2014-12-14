package com.meerkat


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GeoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

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
