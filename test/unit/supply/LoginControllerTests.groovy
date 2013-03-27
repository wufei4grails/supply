package supply



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(LoginController)
class LoginControllerTests {

    void testSomething() {
       def store = new Store(store_name : 'test_name')
       assertEquals "test_name", store.store_name
    }
}
