package com.meerkat

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class Signer_unitController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Signer_unit.list(params), model: [signer_unitInstanceCount: Signer_unit.count()]
    }

    def show(Signer_unit signer_unitInstance) {
        respond signer_unitInstance
    }

    def create() {
        respond new Signer_unit(params)
    }

    @Transactional
    def save(Signer_unit signer_unitInstance) {
        if (signer_unitInstance == null) {
            notFound()
            return
        }

        if (signer_unitInstance.hasErrors()) {
            respond signer_unitInstance.errors, view: 'create'
            return
        }

        signer_unitInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'signer_unit.label', default: 'Signer_unit'), signer_unitInstance.id])
                redirect signer_unitInstance
            }
            '*' { respond signer_unitInstance, [status: CREATED] }
        }
    }

    def edit(Signer_unit signer_unitInstance) {
        respond signer_unitInstance
    }

    @Transactional
    def update(Signer_unit signer_unitInstance) {
        if (signer_unitInstance == null) {
            notFound()
            return
        }

        if (signer_unitInstance.hasErrors()) {
            respond signer_unitInstance.errors, view: 'edit'
            return
        }

        signer_unitInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Signer_unit.label', default: 'Signer_unit'), signer_unitInstance.id])
                redirect signer_unitInstance
            }
            '*' { respond signer_unitInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Signer_unit signer_unitInstance) {

        if (signer_unitInstance == null) {
            notFound()
            return
        }

        signer_unitInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Signer_unit.label', default: 'Signer_unit'), signer_unitInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'signer_unit.label', default: 'Signer_unit'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
