package com.meerkat



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DictionaryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Dictionary.list(params), model:[dictionaryInstanceCount: Dictionary.count()]
    }

    def show(Dictionary dictionaryInstance) {
        respond dictionaryInstance
    }

    def create() {
        respond new Dictionary(params)
    }

    @Transactional
    def save(Dictionary dictionaryInstance) {
        if (dictionaryInstance == null) {
            notFound()
            return
        }

        if (dictionaryInstance.hasErrors()) {
            respond dictionaryInstance.errors, view:'create'
            return
        }

        dictionaryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'dictionary.label', default: 'Dictionary'), dictionaryInstance.id])
                redirect dictionaryInstance
            }
            '*' { respond dictionaryInstance, [status: CREATED] }
        }
    }

    def edit(Dictionary dictionaryInstance) {
        respond dictionaryInstance
    }

    @Transactional
    def update(Dictionary dictionaryInstance) {
        if (dictionaryInstance == null) {
            notFound()
            return
        }

        if (dictionaryInstance.hasErrors()) {
            respond dictionaryInstance.errors, view:'edit'
            return
        }

        dictionaryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Dictionary.label', default: 'Dictionary'), dictionaryInstance.id])
                redirect dictionaryInstance
            }
            '*'{ respond dictionaryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Dictionary dictionaryInstance) {

        if (dictionaryInstance == null) {
            notFound()
            return
        }

        dictionaryInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Dictionary.label', default: 'Dictionary'), dictionaryInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'dictionary.label', default: 'Dictionary'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
