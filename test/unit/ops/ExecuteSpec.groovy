package ops

import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import ops.command.ExeCommand
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
class ExecuteSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test exe"() {
        when:
        def execute = new Execute()
        def server = new Server()
        server.address = "192.168.1.102"
        server.userName = 'yan'
        server.password = 'yan'
        execute.server = server
        def c = new ExeCommand(command: 'ps -A')
        execute.command = c

        then:
        execute.exe()
    }
}
