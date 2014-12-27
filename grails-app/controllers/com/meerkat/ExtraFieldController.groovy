package com.meerkat

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class ExtraFieldController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ExtraField.list(params), model: [extraFieldInstanceCount: ExtraField.count()]
    }

    def show(ExtraField extraFieldInstance) {
        respond extraFieldInstance
    }

    def create() {
        respond new ExtraField(params)
    }

    @Transactional
    def save(ExtraField extraFieldInstance) {
        if (extraFieldInstance == null) {
            notFound()
            return
        }

        if (extraFieldInstance.hasErrors()) {
            respond extraFieldInstance.errors, view: 'create'
            return
        }

        extraFieldInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'extraField.label', default: 'ExtraField'), extraFieldInstance.id])
                redirect extraFieldInstance
            }
            '*' { respond extraFieldInstance, [status: CREATED] }
        }
    }

    def edit(ExtraField extraFieldInstance) {
        respond extraFieldInstance
    }

    @Transactional
    def update(ExtraField extraFieldInstance) {
        if (extraFieldInstance == null) {
            notFound()
            return
        }

        if (extraFieldInstance.hasErrors()) {
            respond extraFieldInstance.errors, view: 'edit'
            return
        }

        extraFieldInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ExtraField.label', default: 'ExtraField'), extraFieldInstance.id])
                redirect extraFieldInstance
            }
            '*' { respond extraFieldInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ExtraField extraFieldInstance) {

        if (extraFieldInstance == null) {
            notFound()
            return
        }

        extraFieldInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ExtraField.label', default: 'ExtraField'), extraFieldInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'extraField.label', default: 'ExtraField'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
