package ops

class ExeResult {

    Execute execute
    String result
    Date createAt = new Date()

    static constraints = {
        result blank: false,size: 1..10000
    }
}
