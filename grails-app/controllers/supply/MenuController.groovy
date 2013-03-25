package supply

import org.springframework.dao.DataIntegrityViolationException

class MenuController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [menuInstanceList: Menu.list(params), menuInstanceTotal: Menu.count()]
    }

    def create() {
        [menuInstance: new Menu(params)]
    }

    def save() {
        def menuInstance = new Menu(params)
        if (!menuInstance.save(flush: true)) {
            render(view: "create", model: [menuInstance: menuInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'menu.label', default: 'Menu'), menuInstance.id])
        redirect(action: "show", id: menuInstance.id)
    }

    def show(Long id) {
        def menuInstance = Menu.get(id)
        if (!menuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'menu.label', default: 'Menu'), id])
            redirect(action: "list")
            return
        }

        [menuInstance: menuInstance]
    }

    def edit(Long id) {
        def menuInstance = Menu.get(id)
        if (!menuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'menu.label', default: 'Menu'), id])
            redirect(action: "list")
            return
        }

        [menuInstance: menuInstance]
    }

    def update(Long id, Long version) {
        def menuInstance = Menu.get(id)
        if (!menuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'menu.label', default: 'Menu'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (menuInstance.version > version) {
                menuInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'menu.label', default: 'Menu')] as Object[],
                          "Another user has updated this Menu while you were editing")
                render(view: "edit", model: [menuInstance: menuInstance])
                return
            }
        }

        menuInstance.properties = params

        if (!menuInstance.save(flush: true)) {
            render(view: "edit", model: [menuInstance: menuInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'menu.label', default: 'Menu'), menuInstance.id])
        redirect(action: "show", id: menuInstance.id)
    }

    def delete(Long id) {
        def menuInstance = Menu.get(id)
        if (!menuInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'menu.label', default: 'Menu'), id])
            redirect(action: "list")
            return
        }

        try {
            menuInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'menu.label', default: 'Menu'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'menu.label', default: 'Menu'), id])
            redirect(action: "show", id: id)
        }
    }
}
