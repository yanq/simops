<div class="exeInfo">
     On server: ${execute.server} , Run by ${execute.account}
</div>
<div class="exeResultList">
    <g:each var="r" in="${execute.exeResults}">
        <div class="commandInfo">${r.command}</div>
        <div class="resultContent">
            <textarea readonly>${r.result}</textarea>
        </div>
    </g:each>
</div>