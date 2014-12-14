package com.meerkat



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ExtraFieldValueController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ExtraFieldValue.list(params), model:[extraFieldValueInstanceCount: ExtraFieldValue.count()]
    }

    def show(ExtraFieldValue extraFieldValueInstance) {
        respond extraFieldValueInstance
    }

    def create() {
        respond new ExtraFieldValue(params)
    }

    @Transactional
    def save(ExtraFieldValue extraFieldValueInstance) {
        if (extraFieldValueInstance == null) {
            notFound()
            return
        }

        if (extraFieldValueInstance.hasErrors()) {
            respond extraFieldValueInstance.errors, view:'create'
            return
        }

        extraFieldValueInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'extraFieldValue.label', default: 'ExtraFieldValue'), extraFieldValueInstance.id])
                redirect extraFieldValueInstance
            }
            '*' { respond extraFieldValueInstance, [status: CREATED] }
        }
    }

    def edit(ExtraFieldValue extraFieldValueInstance) {
        respond extraFieldValueInstance
    }

    @Transactional
    def update(ExtraFieldValue extraFieldValueInstance) {
        if (extraFieldValueInstance == null) {
            notFound()
            return
        }

        if (extraFieldValueInstance.hasErrors()) {
            respond extraFieldValueInstance.errors, view:'edit'
            return
        }

        extraFieldValueInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ExtraFieldValue.label', default: 'ExtraFieldValue'), extraFieldValueInstance.id])
                redirect extraFieldValueInstance
            }
            '*'{ respond extraFieldValueInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ExtraFieldValue extraFieldValueInstance) {

        if (extraFieldValueInstance == null) {
            notFound()
            return
        }

        extraFieldValueInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ExtraFieldValue.label', default: 'ExtraFieldValue'), extraFieldValueInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'extraFieldValue.label', default: 'ExtraFieldValue'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
