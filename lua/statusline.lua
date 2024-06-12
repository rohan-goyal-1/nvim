vim.cmd('hi ActiveBuffer term=underline cterm=underline ctermfg=none ctermbg=none')   

function set_status(args)
   local buffs = {}
   local no_list_buffs = {['']=true, ['[Command Line]']=true}
    for _,v in pairs(vim.fn.getbufinfo({buflisted=1})) do
        local fname = vim.fn.fnamemodify(v.name, ":t")
        if(not no_list_buffs[fname]) then 
            if(v.bufnr == args.buf) then
                fname = '%#ActiveBuffer#'..fname..'%*'
            end
            table.insert(buffs, fname)
        end
    end
    vim.o.statusline = '%F%m %y%='..'<'..table.concat(buffs, ',')..'>'..' %c,%l/%L %P'
end

vim.api.nvim_create_autocmd({'BufEnter'},
 { 
            group = vim.api.nvim_create_augroup('BufStatusLine', {}), 
            callback = set_status 
 })

