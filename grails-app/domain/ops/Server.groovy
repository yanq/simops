package ops

class Server {

    String title
    String address
    String userName
    String password
    Date dateCreated
    Date lastUpdated

    static constraints = {
        title(blank:false,size:1..100,unique:true)
        address(blank:false,size:1..100,unique:true)
        userName(blank:false,size:1..100)
        password(blank:false,size:1..100)
        dateCreated()
        lastUpdated()
    }

    String toString() {
        title
    }
}
