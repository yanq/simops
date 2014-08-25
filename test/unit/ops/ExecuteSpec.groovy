package ops

import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import ops.command.ExeCommand
import ops.command.FileCommand
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

    void "test exe command"() {
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

    void "test file command download"() {
        when:
        def execute = new Execute()
        def server = new Server()
        server.address = "192.168.1.102"
        server.userName = 'yan'
        server.password = 'yan'
        execute.server = server
        def c = new FileCommand(file:'/home/yan/afile',toDir: 'd:/temp',direction: 'download')
        execute.command = c

        then:
        def r = execute.exe()
        println("$r.command \n $r.result")

        when:
        c.file = 'afile'
        then:
        r = execute.exe()
        println(r.command)
        println("$r.command \n $r.result")
    }

    void "test file command upload"() {
        when:
        def execute = new Execute()
        def server = new Server()
        server.address = "192.168.1.102"
        server.userName = 'yan'
        server.password = 'yan'
        execute.server = server
        def c = new FileCommand(file:'d:/temp/localfile',toDir: '/home/yan',direction: 'upload')
        execute.command = c

        then:
        def r = execute.exe()
        println("$r.command \n $r.result")

        when:
        c.file = 'd:/temp/u' //file not found,so dir is not supported
        then:
        r = execute.exe()
        println()
        println("$r.command \n $r.result")
    }

}
