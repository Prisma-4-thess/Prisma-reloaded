package com.meerkat



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class OrgPositionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond OrgPosition.list(params), model:[orgPositionInstanceCount: OrgPosition.count()]
    }

    def show(OrgPosition orgPositionInstance) {
        respond orgPositionInstance
    }

    def create() {
        respond new OrgPosition(params)
    }

    @Transactional
    def save(OrgPosition orgPositionInstance) {
        if (orgPositionInstance == null) {
            notFound()
            return
        }

        if (orgPositionInstance.hasErrors()) {
            respond orgPositionInstance.errors, view:'create'
            return
        }

        orgPositionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'orgPosition.label', default: 'OrgPosition'), orgPositionInstance.id])
                redirect orgPositionInstance
            }
            '*' { respond orgPositionInstance, [status: CREATED] }
        }
    }

    def edit(OrgPosition orgPositionInstance) {
        respond orgPositionInstance
    }

    @Transactional
    def update(OrgPosition orgPositionInstance) {
        if (orgPositionInstance == null) {
            notFound()
            return
        }

        if (orgPositionInstance.hasErrors()) {
            respond orgPositionInstance.errors, view:'edit'
            return
        }

        orgPositionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OrgPosition.label', default: 'OrgPosition'), orgPositionInstance.id])
                redirect orgPositionInstance
            }
            '*'{ respond orgPositionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(OrgPosition orgPositionInstance) {

        if (orgPositionInstance == null) {
            notFound()
            return
        }

        orgPositionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'OrgPosition.label', default: 'OrgPosition'), orgPositionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'orgPosition.label', default: 'OrgPosition'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
