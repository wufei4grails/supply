package supply



import org.junit.*
import grails.test.mixin.*

@TestFor(StockController)
@Mock(Stock)
class StockControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/stock/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.stockInstanceList.size() == 0
        assert model.stockInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.stockInstance != null
    }

    void testSave() {
        controller.save()

        assert model.stockInstance != null
        assert view == '/stock/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/stock/show/1'
        assert controller.flash.message != null
        assert Stock.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/stock/list'

        populateValidParams(params)
        def stock = new Stock(params)

        assert stock.save() != null

        params.id = stock.id

        def model = controller.show()

        assert model.stockInstance == stock
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/stock/list'

        populateValidParams(params)
        def stock = new Stock(params)

        assert stock.save() != null

        params.id = stock.id

        def model = controller.edit()

        assert model.stockInstance == stock
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/stock/list'

        response.reset()

        populateValidParams(params)
        def stock = new Stock(params)

        assert stock.save() != null

        // test invalid parameters in update
        params.id = stock.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/stock/edit"
        assert model.stockInstance != null

        stock.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/stock/show/$stock.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        stock.clearErrors()

        populateValidParams(params)
        params.id = stock.id
        params.version = -1
        controller.update()

        assert view == "/stock/edit"
        assert model.stockInstance != null
        assert model.stockInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/stock/list'

        response.reset()

        populateValidParams(params)
        def stock = new Stock(params)

        assert stock.save() != null
        assert Stock.count() == 1

        params.id = stock.id

        controller.delete()

        assert Stock.count() == 0
        assert Stock.get(stock.id) == null
        assert response.redirectedUrl == '/stock/list'
    }
}
