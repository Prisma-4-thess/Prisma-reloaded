package com.meerkat

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class TypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    /**
     * Loads the template responsible to show all given types. If no types are given it shows all of them.
     * @param typeList : List of types to show.
     * @return
     */
    def listTypes(List<Type> typeList) {
        if (params.typeList == null) typeList = Type.list(params)
        render(template: 'list', model: ['typeList': typeList, 'numOfResults': typeList.size()])
    }

/**
 * Loads the template responsible to show one type.
 * @param typeInstance : Type to show. Can have a value if this function is called like: <g:link action="showType" id="${typeInstance.id}">
 * @return
 */
    def showType(Type typeInstance) {
        render(template: 'show', model: ['typeInstance': typeInstance, 'entityName': 'Type'])
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Type.list(params), model: [typeInstanceCount: Type.count()]
    }

    def show(Type typeInstance) {
        respond typeInstance
    }

    def create() {
        respond new Type(params)
    }

    @Transactional
    def save(Type typeInstance) {
        if (typeInstance == null) {
            notFound()
            return
        }

        if (typeInstance.hasErrors()) {
            respond typeInstance.errors, view: 'create'
            return
        }

        typeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'type.label', default: 'Type'), typeInstance.id])
                redirect typeInstance
            }
            '*' { respond typeInstance, [status: CREATED] }
        }
    }

    def edit(Type typeInstance) {
        respond typeInstance
    }

    @Transactional
    def update(Type typeInstance) {
        if (typeInstance == null) {
            notFound()
            return
        }

        if (typeInstance.hasErrors()) {
            respond typeInstance.errors, view: 'edit'
            return
        }

        typeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Type.label', default: 'Type'), typeInstance.id])
                redirect typeInstance
            }
            '*' { respond typeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Type typeInstance) {

        if (typeInstance == null) {
            notFound()
            return
        }

        typeInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Type.label', default: 'Type'), typeInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'type.label', default: 'Type'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
