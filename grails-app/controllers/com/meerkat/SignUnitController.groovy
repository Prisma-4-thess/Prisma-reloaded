package com.meerkat



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SignUnitController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SignUnit.list(params), model:[signUnitInstanceCount: SignUnit.count()]
    }

    def show(SignUnit signUnitInstance) {
        respond signUnitInstance
    }

    def create() {
        respond new SignUnit(params)
    }

    @Transactional
    def save(SignUnit signUnitInstance) {
        if (signUnitInstance == null) {
            notFound()
            return
        }

        if (signUnitInstance.hasErrors()) {
            respond signUnitInstance.errors, view:'create'
            return
        }

        signUnitInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'signUnit.label', default: 'SignUnit'), signUnitInstance.id])
                redirect signUnitInstance
            }
            '*' { respond signUnitInstance, [status: CREATED] }
        }
    }

    def edit(SignUnit signUnitInstance) {
        respond signUnitInstance
    }

    @Transactional
    def update(SignUnit signUnitInstance) {
        if (signUnitInstance == null) {
            notFound()
            return
        }

        if (signUnitInstance.hasErrors()) {
            respond signUnitInstance.errors, view:'edit'
            return
        }

        signUnitInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SignUnit.label', default: 'SignUnit'), signUnitInstance.id])
                redirect signUnitInstance
            }
            '*'{ respond signUnitInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SignUnit signUnitInstance) {

        if (signUnitInstance == null) {
            notFound()
            return
        }

        signUnitInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SignUnit.label', default: 'SignUnit'), signUnitInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'signUnit.label', default: 'SignUnit'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
