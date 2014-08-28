<div class="exeInfo">
     On server: ${execute.server} <span>by ${execute.account}, at ${execute.createAt}</span>
</div>
<div class="exeResultList">
    <g:each var="r" in="${execute.exeResults}">
        <div class="commandInfo">${r.command}</div>
        <div class="resultContent">
            <textarea readonly>${r.result}</textarea>
        </div>
    </g:each>
</div>