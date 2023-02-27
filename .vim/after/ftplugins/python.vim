let mapleader = ","
nnoremap <leader>df :StripWhitespace <CR> :CocCommand pyright.origanizeimports<CR>
iabbrev ptf @pytest.fixture<enter>def
iabbrev rg @router.get(<enter>"/",<enter>status_code=status.,<enter>description="",<enter>summary="",<enter>)<enter>async def
iabbrev rpost @router.post(<enter>"/",<enter>status_code=status.,<enter>description="",<enter>summary="",<enter>)<enter>async def
iabbrev rput @router.put(<enter>"/",<enter>status_code=status.,<enter>description="",<enter>summary="",<enter>)<enter>async def
iabbrev rpatch @router.patch(<enter>"/",<enter>status_code=status.,<enter>description="",<enter>summary="",<enter>)<enter>async def
iabbrev rdel @router.delete(<enter>"/",<enter>status_code=status.,<enter>description="",<enter>summary="",<enter>)<enter>async def
iabbrev clg response = client.get(<enter>"/"<enter>)
