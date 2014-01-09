
if !exists("g:abusetheforce_dispatch_background")
    let g:abusetheforce_dispatch_background = 0
end

function! AbuseTheForceDeploy()
    let filePath = expand("%")

    let command = "abusetheforce deploy file \"" . filePath . "\""
    call AbuseTheForceTryStart(command)

endfunction

function! AbuseTheForceDeployTest()
    let filePath = expand("%")

    let command = "abusetheforce deploy test \"" . filePath . "\""
    call AbuseTheForceTryStart(command)

endfunction

function! AbuseTheForceRetrieve()
    let filePath = expand("%")

    let command = "abusetheforce retrieve file \"" . filePath . "\""
    call AbuseTheForceTryStart(command)

endfunction

function! AbuseTheForceTarget(...)

    if a:0 > 0

        if a:1 == "?"
            let command = "abusetheforce target list"
        else
            let target = a:1

            let command = "abusetheforce target activate \"" . target . "\""
        end
    else
        let command = "abusetheforce target"
    end

    if exists("l:command")
        call AbuseTheForceTryStart(command)
    end

endfunction

" Try to run the command using vim-dispatch
" (https://github.com/tpope/vim-dispatch)
function! AbuseTheForceTryStart(...)

    " Make sure we have a parameter
    if a:0 > 0
        let command = a:1

        if exists(":Dispatch")
            " Determine foreground or background
            if g:abusetheforce_dispatch_background == 1
                let fgbg = "! "
            else
                let fgbg = " "
            end

            let command =  "Dispatch" . fgbg . command
        else
            let command =  "!" . command
        end

        execute command
    end

endfunction

command! -nargs=0 ForceDeploy call AbuseTheForceDeploy()         " Deploy current file
command! -nargs=0 ForceDeployTest call AbuseTheForceDeployTest() " Deploy current file and run test
command! -nargs=0 ForceRetrieve call AbuseTheForceRetrieve()     " Retrieve current file
command! -nargs=? ForceTarget call AbuseTheForceTarget(<f-args>) " Change deploy target

" Set SF Compiler
autocmd BufNewFile,BufRead *.cls,*.trigger,*.page,*.component compiler AbuseTheForce

