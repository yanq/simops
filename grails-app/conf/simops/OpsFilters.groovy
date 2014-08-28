package simops

class OpsFilters {

    def filters = {

        def publicControllers = [null,'assets','user']
        def accountControllers = ['ops']
        def adminControllers = ['admin','account','server','task','project','exeCommand','fileCommand','command']

        def apps = publicControllers+accountControllers+adminControllers
        def loginControllers=accountControllers+adminControllers

        //performance
        timeLog(controller:'*'){
            before = {
                request.beforeTime = new Date()
            }
            after = {
                log.info "timeLog: ${request.requestURI} ${new Date().time - request.beforeTime.time}ms"
            }
        }

        //app check
        appCheck(controller:'*') {
            before = {
                log.debug 'params : '+params
                if(!(controllerName in apps)){
                    log.warn("no reg ,controller: "+controllerName)
                    render "no reg controller : $controllerName"
                    return false
                }
            }
        }

        // login check
        loginCheck(controller:'*') {
            before = {
                if(controllerName in publicControllers) return true

                if(controllerName in loginControllers){
                    if(!session.user) {
                        flash.message = "Login,please"
                        session.backUri = request.forwardURI
                        log.warn('require login to there:'+session.backUri)
                        redirect(controller:'user',action:'login')
                        return false
                    }
                }
            }
        }

        //admin
        adminCheck(controller:'*'){
            before = {
                if(controllerName in adminControllers){
                    if(session.user?.nickName=='admin'){
                        return true
                    }else{
                        flash.message = "Login by admin,please"
                        redirect(controller:'user',action:'login')
                        return false
                    }
                }
            }
        }
    }
}
