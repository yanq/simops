package ops.command



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FileCommandController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond FileCommand.list(params), model:[fileCommandInstanceCount: FileCommand.count()]
    }

    def show(FileCommand fileCommandInstance) {
        respond fileCommandInstance
    }

    def create() {
        respond new FileCommand(params)
    }

    @Transactional
    def save(FileCommand fileCommandInstance) {
        if (fileCommandInstance == null) {
            notFound()
            return
        }

        if (fileCommandInstance.hasErrors()) {
            respond fileCommandInstance.errors, view:'create'
            return
        }

        fileCommandInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'fileCommand.label', default: 'FileCommand'), fileCommandInstance.id])
                redirect fileCommandInstance
            }
            '*' { respond fileCommandInstance, [status: CREATED] }
        }
    }

    def edit(FileCommand fileCommandInstance) {
        respond fileCommandInstance
    }

    @Transactional
    def update(FileCommand fileCommandInstance) {
        if (fileCommandInstance == null) {
            notFound()
            return
        }

        if (fileCommandInstance.hasErrors()) {
            respond fileCommandInstance.errors, view:'edit'
            return
        }

        fileCommandInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'FileCommand.label', default: 'FileCommand'), fileCommandInstance.id])
                redirect fileCommandInstance
            }
            '*'{ respond fileCommandInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(FileCommand fileCommandInstance) {

        if (fileCommandInstance == null) {
            notFound()
            return
        }

        fileCommandInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'FileCommand.label', default: 'FileCommand'), fileCommandInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'fileCommand.label', default: 'FileCommand'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
