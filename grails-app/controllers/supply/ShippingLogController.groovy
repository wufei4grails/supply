package supply

import org.springframework.dao.DataIntegrityViolationException

class ShippingLogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [shippingLogInstanceList: ShippingLog.list(params), shippingLogInstanceTotal: ShippingLog.count()]
    }

    def create() {
        [shippingLogInstance: new ShippingLog(params)]
    }

    def saveShippingLog() {
        def shippingLogInstance = new ShippingLog(params)
        if (!shippingLogInstance.save(flush: true)) {
            render(view: "create", model: [shippingLogInstance: shippingLogInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'shippingLog.label', default: 'ShippingLog'), shippingLogInstance.id])
        redirect(action: "show", id: shippingLogInstance.id)
    }

    def show(Long id) {
        def shippingLogInstance = ShippingLog.get(id)
        if (!shippingLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shippingLog.label', default: 'ShippingLog'), id])
            redirect(action: "list")
            return
        }

        [shippingLogInstance: shippingLogInstance]
    }

    def edit(Long id) {
        def shippingLogInstance = ShippingLog.get(id)
        if (!shippingLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shippingLog.label', default: 'ShippingLog'), id])
            redirect(action: "list")
            return
        }

        [shippingLogInstance: shippingLogInstance]
    }

    def update(Long id, Long version) {
        def shippingLogInstance = ShippingLog.get(id)
        if (!shippingLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shippingLog.label', default: 'ShippingLog'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (shippingLogInstance.version > version) {
                shippingLogInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'shippingLog.label', default: 'ShippingLog')] as Object[],
                          "Another user has updated this ShippingLog while you were editing")
                render(view: "edit", model: [shippingLogInstance: shippingLogInstance])
                return
            }
        }

        shippingLogInstance.properties = params

        if (!shippingLogInstance.save(flush: true)) {
            render(view: "edit", model: [shippingLogInstance: shippingLogInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'shippingLog.label', default: 'ShippingLog'), shippingLogInstance.id])
        redirect(action: "show", id: shippingLogInstance.id)
    }

    def delete(Long id) {
        def shippingLogInstance = ShippingLog.get(id)
        if (!shippingLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shippingLog.label', default: 'ShippingLog'), id])
            redirect(action: "list")
            return
        }

        try {
            shippingLogInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'shippingLog.label', default: 'ShippingLog'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'shippingLog.label', default: 'ShippingLog'), id])
            redirect(action: "show", id: id)
        }
    }
}
