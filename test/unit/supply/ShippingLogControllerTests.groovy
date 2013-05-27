package supply



import org.junit.*
import grails.test.mixin.*

@TestFor(ShippingLogController)
@Mock(ShippingLog)
class ShippingLogControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/shippingLog/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.shippingLogInstanceList.size() == 0
        assert model.shippingLogInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.shippingLogInstance != null
    }

    void testSave() {
        controller.save()

        assert model.shippingLogInstance != null
        assert view == '/shippingLog/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/shippingLog/show/1'
        assert controller.flash.message != null
        assert ShippingLog.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/shippingLog/list'

        populateValidParams(params)
        def shippingLog = new ShippingLog(params)

        assert shippingLog.save() != null

        params.id = shippingLog.id

        def model = controller.show()

        assert model.shippingLogInstance == shippingLog
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/shippingLog/list'

        populateValidParams(params)
        def shippingLog = new ShippingLog(params)

        assert shippingLog.save() != null

        params.id = shippingLog.id

        def model = controller.edit()

        assert model.shippingLogInstance == shippingLog
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/shippingLog/list'

        response.reset()

        populateValidParams(params)
        def shippingLog = new ShippingLog(params)

        assert shippingLog.save() != null

        // test invalid parameters in update
        params.id = shippingLog.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/shippingLog/edit"
        assert model.shippingLogInstance != null

        shippingLog.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/shippingLog/show/$shippingLog.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        shippingLog.clearErrors()

        populateValidParams(params)
        params.id = shippingLog.id
        params.version = -1
        controller.update()

        assert view == "/shippingLog/edit"
        assert model.shippingLogInstance != null
        assert model.shippingLogInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/shippingLog/list'

        response.reset()

        populateValidParams(params)
        def shippingLog = new ShippingLog(params)

        assert shippingLog.save() != null
        assert ShippingLog.count() == 1

        params.id = shippingLog.id

        controller.delete()

        assert ShippingLog.count() == 0
        assert ShippingLog.get(shippingLog.id) == null
        assert response.redirectedUrl == '/shippingLog/list'
    }
}
