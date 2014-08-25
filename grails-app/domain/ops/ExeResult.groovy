package ops

class ExeResult {

    Execute execute
    String command
    String result
    Date createAt = new Date()

    static constraints = {
        execute()
        command blank: false,size: 1..2000
        result nullable: true,size: 1..10000
        createAt()
    }
}
