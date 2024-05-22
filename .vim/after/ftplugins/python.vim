let mapleader = ","
nnoremap <leader>df :StripWhitespace <CR> :CocCommand pyright.origanizeimports<CR>
iabbrev ptf @pytest.fixture<enter>def
iabbrev rg @router.get(<enter>"/",<enter>status_code=status.,<enter>description="",<enter>summary="",<enter>)<enter>async def
iabbrev rpost @router.post(<enter>"/",<enter>status_code=status.,<enter>description="",<enter>summary="",<enter>)<enter>async def
iabbrev rput @router.put(<enter>"/",<enter>status_code=status.,<enter>description="",<enter>summary="",<enter>)<enter>async def
iabbrev rpatch @router.patch(<enter>"/",<enter>status_code=status.,<enter>description="",<enter>summary="",<enter>)<enter>async def
iabbrev rdel @router.delete(<enter>"/",<enter>status_code=status.,<enter>description="",<enter>summary="",<enter>)<enter>async def
iabbrev clg response = client.get(<enter>"/"<enter>)
iabbrev djm class (models.Model):<enter><enter>"""xx.xx."""<enter><enter>class Meta:<enter>verbose_name = "xx.xx"<enter>verbose_name_plural = "xx.xx"<enter><enter><backspace>def __str__(self) -> str:<enter>return f"{self._meta.verbose_name} #{self.pk}"<Home><Left><Up><Up><Up><Up><Up><Up><Up><Up><Up><Right><Right><Right><Right><Right><esc>:%s/xx\.xx/
iabbrev mfk models.ForeignKey(<enter>verbose_name="",<enter>to="",<enter>related_name="",<enter>on_delete=models.,<enter>)<Up><Up><Up><Up><End><Left>
iabbrev moto models.OneToOneField(<enter>verbose_name="",<enter>to="",<enter>related_name="",<enter>on_delete=models.,<enter>)<Up><Up><Up><Up><End><Left>
iabbrev mmtm models.ManyToManyField(<enter>verbose_name="",<enter>to="",<enter>blank=True,<enter>related_name="",<enter>)<Up><Up><Up><End><Left>
iabbrev mcf models.CharField(<enter>verbose_name="",<enter>max_length=...,<enter>blank=...,<enter>help_text="Обязательно; Максимальная длина - ... символов",<enter>)<Up><Up><Up><End><Left>
iabbrev mif models.ImageField(<enter>verbose_name="",<enter>upload_to=...,<enter>blank=...,<enter>help_text="Обязательно",<enter>)<Up><Up><Up><End><Left>
iabbrev djf classxx.xxFactory(factory.django.DjangoModelFactory):<enter><enter>"""."""<enter><enter>class Meta:<enter>model =xx.xx<esc>:%s/xx\.xx/
iabbrev fSq factory.Sequence(lambda n: f"{n + 1}")<esc>^yef"pi <esc>bvUf<space><esc>xli
