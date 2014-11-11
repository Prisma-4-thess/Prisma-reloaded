package com.meerkat



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DictionaryItemController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DictionaryItem.list(params), model:[dictionaryItemInstanceCount: DictionaryItem.count()]
    }

    def show(DictionaryItem dictionaryItemInstance) {
        respond dictionaryItemInstance
    }

    def create() {
        respond new DictionaryItem(params)
    }

    @Transactional
    def save(DictionaryItem dictionaryItemInstance) {
        if (dictionaryItemInstance == null) {
            notFound()
            return
        }

        if (dictionaryItemInstance.hasErrors()) {
            respond dictionaryItemInstance.errors, view:'create'
            return
        }

        dictionaryItemInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'dictionaryItem.label', default: 'DictionaryItem'), dictionaryItemInstance.id])
                redirect dictionaryItemInstance
            }
            '*' { respond dictionaryItemInstance, [status: CREATED] }
        }
    }

    def edit(DictionaryItem dictionaryItemInstance) {
        respond dictionaryItemInstance
    }

    @Transactional
    def update(DictionaryItem dictionaryItemInstance) {
        if (dictionaryItemInstance == null) {
            notFound()
            return
        }

        if (dictionaryItemInstance.hasErrors()) {
            respond dictionaryItemInstance.errors, view:'edit'
            return
        }

        dictionaryItemInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DictionaryItem.label', default: 'DictionaryItem'), dictionaryItemInstance.id])
                redirect dictionaryItemInstance
            }
            '*'{ respond dictionaryItemInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DictionaryItem dictionaryItemInstance) {

        if (dictionaryItemInstance == null) {
            notFound()
            return
        }

        dictionaryItemInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DictionaryItem.label', default: 'DictionaryItem'), dictionaryItemInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'dictionaryItem.label', default: 'DictionaryItem'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
