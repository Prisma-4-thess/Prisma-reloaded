package com.meerkat



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DecisionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Decision.list(params), model:[decisionInstanceCount: Decision.count()]
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
            respond decisionInstance.errors, view:'create'
            return
        }

        decisionInstance.save flush:true

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
            respond decisionInstance.errors, view:'edit'
            return
        }

        decisionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Decision.label', default: 'Decision'), decisionInstance.id])
                redirect decisionInstance
            }
            '*'{ respond decisionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Decision decisionInstance) {

        if (decisionInstance == null) {
            notFound()
            return
        }

        decisionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Decision.label', default: 'Decision'), decisionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'decision.label', default: 'Decision'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
