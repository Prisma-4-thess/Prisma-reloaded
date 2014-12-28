package com.meerkat

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class SignerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    /**
     * Loads the template responsible to show all given signers. If no signers are given it shows all of them.
     * @param signerList : List of signers to show.
     * @return
     */
    def listSigners(List<Signer> signerList) {
        if (params.signerList == null) signerList = Signer.list(params)
        render(template: 'list', model: ['signerList': signerList, 'numOfResults': signerList.size()])
    }

/**
 * Loads the template responsible to show one signer.
 * @param signerInstance : Signer to show. Can have a value if this function is called like: <g:link action="showSigner" id="${signerInstance.id}">
 * @return
 */
    def showSigner(Signer signerInstance) {
        render(template: 'show', model: ['signerInstance': signerInstance, 'entityName': 'Signer'])
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Signer.list(params), model: [signerInstanceCount: Signer.count()]
    }

    def show(Signer signerInstance) {
        respond signerInstance
    }

    def create() {
        respond new Signer(params)
    }

    @Transactional
    def save(Signer signerInstance) {
        if (signerInstance == null) {
            notFound()
            return
        }

        if (signerInstance.hasErrors()) {
            respond signerInstance.errors, view: 'create'
            return
        }

        signerInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'signer.label', default: 'Signer'), signerInstance.id])
                redirect signerInstance
            }
            '*' { respond signerInstance, [status: CREATED] }
        }
    }

    def edit(Signer signerInstance) {
        respond signerInstance
    }

    @Transactional
    def update(Signer signerInstance) {
        if (signerInstance == null) {
            notFound()
            return
        }

        if (signerInstance.hasErrors()) {
            respond signerInstance.errors, view: 'edit'
            return
        }

        signerInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Signer.label', default: 'Signer'), signerInstance.id])
                redirect signerInstance
            }
            '*' { respond signerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Signer signerInstance) {

        if (signerInstance == null) {
            notFound()
            return
        }

        signerInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Signer.label', default: 'Signer'), signerInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'signer.label', default: 'Signer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
