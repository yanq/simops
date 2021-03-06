package ops


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ServerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Server.list(params), model: [serverInstanceCount: Server.count()]
    }

    def show(Server serverInstance) {
        respond serverInstance
    }

    def create() {
        respond new Server(params)
    }

    @Transactional
    def save(Server serverInstance) {
        if (serverInstance == null) {
            notFound()
            return
        }

        if (serverInstance.hasErrors()) {
            respond serverInstance.errors, view: 'create'
            return
        }

        serverInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'server.label', default: 'Server'), serverInstance.id])
                redirect serverInstance
            }
            '*' { respond serverInstance, [status: CREATED] }
        }
    }

    def edit(Server serverInstance) {
        respond serverInstance
    }

    @Transactional
    def update(Server serverInstance) {
        if (serverInstance == null) {
            notFound()
            return
        }

        if (serverInstance.hasErrors()) {
            respond serverInstance.errors, view: 'edit'
            return
        }

        serverInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Server.label', default: 'Server'), serverInstance.id])
                redirect serverInstance
            }
            '*' { respond serverInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Server serverInstance) {

        if (serverInstance == null) {
            notFound()
            return
        }

        serverInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Server.label', default: 'Server'), serverInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'server.label', default: 'Server'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
