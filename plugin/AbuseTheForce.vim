
function! AbuseTheForceDeploy()
    let filePath = expand("%")

    "let command = "!echo \"" . filePath . "\""
    let command = "!abusetheforce deploy file \"" . filePath . "\""
    execute command

endfunction

function! AbuseTheForceRetrieve()
    let filePath = expand("%")

    "let command = "!echo \"" . filePath . "\""
    let command = "!abusetheforce retrieve file \"" . filePath . "\""
    execute command

endfunction

function! AbuseTheForceTarget(...)

    if a:0 > 0
        let target = a:1

        let command = "!abusetheforce target activate \"" . target . "\""
        execute command
    else
        let command = "!abusetheforce target"
        execute command
    end

endfunction

command -nargs=0 ForceDeploy call AbuseTheForceDeploy()         " Deploy current file
command -nargs=0 ForceRetrieve call AbuseTheForceRetrieve()     " Retrieve current file
command -nargs=? ForceTarget call AbuseTheForceTarget(<f-args>) " Change deploy target

" Set SF Compiler
autocmd BufNewFile,BufRead *.cls,*.trigger,*.page,*.component compiler AbuseTheForce

