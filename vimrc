" vim: fdm=marker fdc=2 foldlevelstart=0 sts=4 sw=4 tw=64 fileencoding=utf-8:
set rtp+=~/.vim/vundle.git/ 
call vundle#rc()
"Screen совместимость
set t_Co=256
set ttymouse=xterm2

"Text/Code Navigation
"    F1  Help
"    F2  Code Explorer
"    F3  Find Next
"    F4  

"Explore Buffers and Files
"    F5  Execute buffer
"    F6  Buffer Explorer
"    F7  List of Files in Directory
"    F8  File Explorer

"Manipulate Windows and Buffers
"    F9  Restore Last Session
"    F10 Toggle Fullscreen
"    F11 Close Current Window
"    F12 Delete Current Buffer

" ==============================================================================
" Установленные плагины и их зависимости {{{1
Bundle "http://github.com/motemen/git-vim.git"
Bundle "TaskList.vim"
Bundle "Screen-vim"
Bundle "ZenCoding.vim"
Bundle "snipMate"
Bundle "Conque-Shell"
Bundle "taglist.vim"
Bundle "Source-Explorer-srcexpl.vim"
Bundle "http://github.com/vim-scripts/matrix.vim--Yang.git"
" для входа в матрицу ввести команду :Matrix
Bundle "http://github.com/vim-scripts/The-NERD-Commenter.git"
Bundle "http://github.com/vim-scripts/The-NERD-tree.git"
Bundle "mru.vim"
Bundle "sessionman.vim"
Bundle "pyflakes.vim"
Bundle "calendar.vim--Matsumoto" 
Bundle "FuzzyFinder"
Bundle "L9"
Bundle "neocomplcache"
"Bundle "ropevim"
Bundle "easytags.vim"
Bundle "python.vim--Vasiliev"
Bundle "vimwiki"
" }}}
" ==============================================================================
" "Primary"                 Приоритетные настройки {{{1
" ==============================================================================

let s:iswin = has('win32') || has('win64')
let s:lastsession_file = '~/lastsession.vim'

" Отключение совместимости с vi
set nocompatible

" Использовать англоязычное меню
set langmenu=en

" ==============================================================================
" "Quick"                   Быстрые настройки {{{1
" ==============================================================================
" (0 - откл. 1 - вкл.)

" us - USer option
let s:us_folding        = 1     " Свертывание участков кода
let s:us_autosaveses    = 1     " Авто-сохранение сессий (загрузка посл. F6)
let s:us_linewrap       = 1     " Перенос длинных строк
let s:us_scratch_buffer = 0     " Сделать из безымянного буфера scratch буфер

" ==============================================================================
" "Includes"                Подключение доп.файлов настроек {{{1
" ==============================================================================

"source $VIMRUNTIME/mswin.vim            " Windows-like настройки
"behave mswin

"==============================================================================
" "Basic"                   Базовые настройки {{{1
" ==============================================================================

" Включение подсветки синтаксиса
syntax on

" Включение определения типов файлов
filetype on
filetype plugin on
filetype indent on

" Отключение оповещения морганием и звуком
set novisualbell
"set t_vb=

set helplang=en,ru

" Переход на предыдущую/следующую строку
set backspace=indent,eol,start

" Перемещать курсор на следующую строку при нажатии на клавиши вправо-влево и пр.
set whichwrap+=<,>,[,]

" История команд
set history=150

" Максимальное количество изменений, которые могут быть отменены
set undolevels=5000

" Не создавать резервные копии файлов
set nobackup

" Кодировка по умолчанию
set encoding=utf-8
set fileencoding=utf-8

set fileencodings=utf-8,cp1251,cp866,koi8-r

set fileformat=unix          " Формат файла по умолчанию
set fileformats=unix,dos,mac

" Не выгружать буфер, при переключении на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без
" необходимости сохранения каждый раз когда переключаешься между ними
set hidden

set autoread            " Включение автоматического перечтения файла при изменении
set autochdir           " Автоматически устанавливать текущей, директорию отрытого файла
set browsedir=buffer    " Начинать обзор с каталога текущего буфера
set confirm             " Включение диалогов с запросами

" Опции авто-дополнения
set completeopt=longest,menuone

" Показывать все возможные кандидаты при авто-завершении команд
"set nowildmenu
set wildmode=list:longest,full

" Включение проверки орфографии, для русского и английского
set spelllang=ru_yo,en_us
"set spell

" Раскладка по умолчанию - английская
set iminsert=0

" Не перерисовывать окно при работе макросов
set lazyredraw

" ==============================================================================
" "View"                    Вид {{{1
" ==============================================================================

set ruler       " Включение отображения позиции курсора (всё время)

set mouse=a     " Подключение мыши
set mousehide   " Прятать указатель во время набора текста
set cursorline  " Включить подсветку текущей позиции курсора
set mousemodel=popup

if has('gui_running')

    " Шрифт по умолчанию
    if s:iswin
    set gfn=consolas:h11
    "set gfn=DejaVu_Sans_Mono:h10:cRUSSIAN,consolas:h11
    elseif has("gui_gtk2")
        set gfn=DejaVu\ Sans\ Mono\ 10
    endif

    " Цветовая схема по умолчанию
    colorscheme tesla

elseif s:iswin
    colorscheme desert
else
    colorscheme wombat256mod
endif

if s:iswin
    " Установка высоты и ширины окна
    winsize 90 30
endif

"set guioptions+=b   " Включение горизонтального скролл-бара
"set guioptions-=T   " Убрать toolbar
"set guioptions+=c   " Отключение графических диалогов
"set guioptions-=e   " Замена графических табов, текстовыми

set number          " Включение отображения номеров строк
set shortmess+=I    " Отключение приветственного сообщения
set showtabline=2   " Показывать по умлочанию строку со вкладками
set wildmenu        " Показывать меню в командной строке
                    " для выбора вариантов авто-дополнения
set showmatch       " Довсвечивать совпадающую скобку
set list            " Подсвечивать некоторые символы

" Установка символов для подсветки
set list listchars=tab:▹·,trail:·,extends:»,precedes:«,nbsp:×

" ==============================================================================
" "Statusline"               Статусная строка {{{1
" ==============================================================================

" Включение отображения незавершенных команд в статусной строке
set showcmd

" Всегда отображать статусную строку
set laststatus=2

hi StatusLineBufferNumber guifg=fg guibg=bg gui=bold

" Формат статусной строки
set stl=
set stl+=\ %#StatusLineBufferNumber#
set stl+=[%n]    " Номер буфера
set stl+=%*\
set stl+=%<
set stl+=%f      " Имя файла загруженного в буфер
set stl+=%*\
set stl+=[%{&ft} " Тип файла, загруженного в буфер, например [cpp]
set stl+=\ \|\
set stl+=%{&fileencoding} " Кодировка файла
set stl+=\ \|\
set stl+=%{&ff}] " Формат файла
set stl+=%=      " Выравнивание по правому краю
set stl+=\
set stl+=Line:
set stl+=\ %l/   " Номер строки
set stl+=%L      " Количество строк в буфере
set stl+=\
set stl+=Col:
set stl+=\ %3v   " Номер колонки
set stl+=\
set stl+=[%P]    " Позиция текста, отображаемого в окне
                 " по отношению к началу файла в процентах
set stl+=%#error#%m%*       " Флаг состояния несохранённых изменений
set stl+=%#warningmsg#%r%*  " Флаг состояния 'только для чтения

" Показ нескольких типов предупреждений связанных с некорректной работой с
" отступами:
" "[mixed-indenting]" - В случае если в файле для задания отступов совместно
" используются пробелы и символы табуляции
" "[expandtab-disabled]" - Если опция expandtab отключена, но в файле для
" задания отступов применяются пробелы
" "[expandtab-enabled]" - Если опция expandtab активна, но для задания
" отступов используются символы табуляции
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

" ==============================================================================
" "Indent"                  Отступы и табуляция {{{1
" ==============================================================================

set autoindent                          " Наследовать отступы предыдущей строки
"set smartindent                         " Включить 'умные' отступы
set expandtab                           " Преобразование таба в пробелы
set shiftwidth=4                        " Размер табуляции по умолчанию
set softtabstop=4
set tabstop=4

" ==============================================================================
" "Search"                  Поиск текста {{{1
" ==============================================================================

set hlsearch        " Включение подсветки слов при поиске
set incsearch       " Использовать поиск по мере набора

" Использовать регистра-зависимый поиск (для 
" регистра-независимого использовать \с в конце строки шаблона)
"set noignorecase
set ignorecase "поменял на регистро независимый ван

" В режиме поиска используется раскладка, заданная по умолчанию
set imsearch=-1

" ==============================================================================
" "Folding"                 Свертывание блоков текста {{{1
" ==============================================================================

if s:us_folding
    " Включение складок
    set foldenable

    " Ширина колонки
    "set foldcolumn=4

    " Опция задаёт значение опции 'foldlevel' в начале редактирования нового
    " буфера в окне. Её полезно использовать для закрытия всех складок в
    " файле в начале редактирования (при значении 0), закрытия некоторых
    " складок (при значении от 1) или открывания всех складок (при значении 99)
    set foldlevelstart=99

    " Опция задаёт метод образования складок для текущего окна.
    " Список возможных значений:
    "   manual  Складки создаются вручную.
    "   indent  Складка формируется строками с одинаковыми отступами.
    "   expr    Уровень складки для строки задаётся значением опции 'foldexpr'.
    "   marker  Складки задаются с использованием маркеров.
    "   syntax  Складки задаются в соответствии с правилами подсветки синтаксиса.
    "   diff    В складки помещаются неизменённые фрагменты текста
    set foldmethod=indent

    " Опция назначает максимальное количество вложений складок для методов
    " "indent" и "syntax". Опция позволяет избежать создания слишком
    " большого количества складок. Использование значения, большего, чем 20,
    " не работает, поскольку встроенное ограничение количества вложений в
    " складках соответствует 20
    set foldnestmax=3

else
    set foldmethod=manual

endif

" ==============================================================================
" "Sessions"                Сессии {{{1
" ==============================================================================

" Опции сессий
set sessionoptions=curdir,buffers,folds,tabpages,winpos,help

" Опции помогают переносить файлы сессий с *nix`ов в ms-windows и наоборот
set sessionoptions+=unix,slash

if s:us_autosaveses
    " Авто-сохранение сессии при закрытии vim`a (загрузка F6 в норм. режиме)
    exec 'autocmd VimLeavePre * silent mksession!' . s:lastsession_file
endif

" ==============================================================================
" "LineWrap"                Перенос длинных строк {{{1
" ==============================================================================

if s:us_linewrap
    " Задать ширину строки
    "set textwidth=79

    if v:version >= 703
        " Подсвечивать границы
        set colorcolumn=80
    endif
    " Перенос по словам
    set linebreak
else
    " Запретить перенос строк
    set nowrap

    " показывать символы > или < если есть, что слева/справа строки
    set listchars+=precedes:<,extends:>

endif

" ==============================================================================
" "User Shortcuts"          Горячие клавиши {{{1
" ==============================================================================

" New leader key
let mapleader = ","
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" Русская расскладка
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Do :help cope if you are unsure what cope is. It's super
" useful!
map <leader>bc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>
" just subsitute ESC with ,
map <leader> ,

"fast copy
"
nmap <leader>y "*y
nmap <leader>Y "yy
nmap <leader>p "*p
nmap <leader>0 "0p
nmap <leader>1 "1p
nmap <leader>2 "2p
nmap <leader>3 "3p
nmap <leader>4 "4p
nmap <leader>5 "5p
nmap <leader>6 "6p
nmap <leader>7 "7p
nmap <leader>8 "8p
nmap <leader>9 "9p
"show registers
nmap <leader>r :registers<CR>
" Открытие командной строки помощи (plugin-FuzzyFinder)
map <C-F1> :FufHelp<cr>
vmap <C-F1> <esc>:FufHelp<cr>
imap <C-F1> <esc>:FufHelp<cr>

" Список тегов (plugin-taglist)
nmap <F2> <Esc>:TlistToggle<cr>
vmap <F2> <esc>:TlistToggle<cr>
imap <F2> <esc><esc>:TlistToggle<cr>

" Найти следующее соответствие, все остальные так же подсвечиваются 
nmap <F3> :set hlsearch<CR>n
vmap <F3> <esc> :set hlsearch<CR>n i
imap <F3> <esc> :set hlsearch<CR>n i

" Отключение подсведки найденных выражений
nmap <C-F3> :nohlsearch<CR>
imap <C-F3> <Esc>:nohlsearch<CR>
vmap <C-F3> <Esc>:nohlsearchi<CR>gv

" Выполнение/Открытие файла
nmap <F5> <esc>:call <SID>OpenFileInDefaultApp()<cr>
vmap <F5> <esc>:call <SID>OpenFileInDefaultApp()<cr>i
imap <F5> <esc><esc>:call <SID>OpenFileInDefaultApp()<cr>i

" Просмотр списка буферов (plugin-fuzzyfinder)
map <F6> :FufBuffer<cr>
vmap <F6> <esc>:FufBuffer<cr>
imap <F6> <esc>:FufBuffer<cr>


" Список файлов в текущей директории (plugin-fuzzyfinder)
nmap <F7> <esc>:FufFile<cr>
vmap <F7> <esc>:FufFile<cr>
imap <F7> <esc>:FufFile<cr>

"" Навигатор по коду (plugin-sourceExplorer)
map <C-F8> :SrcExplToggle<cr>
vmap <C-F8> <esc>:SrcExplToggle<cr>
imap <C-F8> <esc>:SrcExplToggle<cr>

"" Обновление файла тегов для CodeExplorer (plugin-sourceExplorer)
"map <C-F8> :call g:SrcExpl_UpdateTags()<cr>
"vmap <C-F8> <esc>:call g:SrcExpl_UpdateTags()<cr>i
"imap <C-F8> <esc>:call g:SrcExpl_UpdateTags()<cr>i

" Обозреватель файлов (plugin-NERD_Tree)
map <F8> :NERDTreeToggle<cr>
vmap <F8> <esc>:NERDTreeToggle<cr>
imap <F8> <esc>:NERDTreeToggle<cr>

" Загрузка последней сессии (работает если в
" секции "Сессии" определена команда авто-сохранения)
if s:us_autosaveses
    exec 'nmap <F9> <esc>:source ' . s:lastsession_file . '<cr>'
    exec 'vmap <F9> <esc>:source ' . s:lastsession_file . '<cr>'
    exec 'imap <F9> <esc>:source ' . s:lastsession_file . '<cr>i'
endif

" Полноэкранный режим (plugin-vimshell)
"inoremap <F10> <C-o>:Fullscreen<CR>
"nnoremap <F10> :Fullscreen<CR>

" Закрыть окно
map <F11> :close<cr>
vmap <F11> <esc>:close<cr>i
imap <F11> <esc>:close<cr>i

" Удалить буфер
map <F12> :bdelete<cr>
vmap <F12> <esc>:bdelete<cr>
imap <F12> <esc>:bdelete<cr>


" Создать базу данных для файлов в текущей директории
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" CTRL+Space для автозавершения (plugin-neocomplcache)
"imap <C-Space> <C-X><C-U>

" Использование rope code assist, вместо omni completion
" для файлов python при нажатии CTRL+Space
" (plugin-ropevim)
"au FileType python imap <buffer> <C-space> <C-R>=RopeCodeAssistInsertMode()<cr>


" Добавление(Ctrl+Tab)/удаление(Ctrl+Shift+Tab) отступов
" работает только если выделить текст
map  ]v          [[V]]
"map  <C-S-tab>   [[V]]<
vmap <C-S-tab>   <
"map  <C-tab>     [[V]]>
vmap <C-tab>     >

" Раскрыть сниппет/переход по сниппету (plugin-neocomplcache)
imap <silent><C-j> <Plug>(neocomplcache_snippets_expand)
smap <silent><C-j> <Plug>(neocomplcache_snippets_expand)

" Поставить/убрать отметку перейти к следующей/предыдущей
" отметке (plugin-visualmark)
"nmap mm <Plug>Vm_toggle_sign
"nmap mn <Plug>Vm_goto_next_sign
"nmap mp <Plug>Vm_goto_prev_sign

" Пометить/убрать все слова совподающие со словом под курсором (plugin-Mark)
"nmap <silent>mw :call mark#MarkCurrentWord()<CR>

" Установка быстрой помощи по K для слова под курсором с помощью pydoc
" для файлов python (plugin-ropevim)
au FileType python nmap <buffer> <S-K> :call RopeShowDoc()<CR>

"function! TabWrapperRope()
    "if strpart(getline('.'), 0, col('.')-1) =~ '^\s*$'
      "return "\<Tab>"
    "else
        "return "\<C-R>=RopeCodeAssistInsertMode()\<CR>"
    "endif
"endfunction

"imap <Tab> <C-R>=TabWrapperRope()<CR>


" Переход к определению для файлов python по gd выполняется с
" помощью rope (Plugin-ropevim)
au FileType python nmap <buffer> gd :call RopeGotoDefinition()<CR>

 "Комбинации оставленные по умолчанию:
"
"vis \cc    комментирование выделенного участка кода (plugin-NERD_commenter)
"vis \cu    разкомментирование выделенного участка кода (plugin-NERD_commenter)

" навигаци по окнам =================================
" Move the cursor to the window left of the current one
noremap <silent> ,h :wincmd h<cr>

" Move the cursor to the window below the current one
noremap <silent> ,j :wincmd j<cr>

" Move the cursor to the window above the current one
noremap <silent> ,k :wincmd k<cr>

" Move the cursor to the window right of the current one
noremap <silent> ,l :wincmd l<cr>

" Close the window below this one
noremap <silent> ,cj :wincmd j<cr>:close<cr>

" Close the window above this one
noremap <silent> ,ck :wincmd k<cr>:close<cr>

" Close the window to the left of this one
noremap <silent> ,ch :wincmd h<cr>:close<cr>

" Close the window to the right of this one
noremap <silent> ,cl :wincmd l<cr>:close<cr>

" Close the current window
"noremap <silent> ,cc :close<cr>

" Move the current window to the right of the main Vim window
noremap <silent> ,ml <C-W>L

" Move the current window to the top of the main Vim window
noremap <silent> ,mk <C-W>K

" Move the current window to the left of the main Vim window
noremap <silent> ,mh <C-W>H

" Move the current window to the bottom of the main Vim window
noremap <silent> ,mj <C-W>J
" ==============================================================================
" "Menu"                    Меню {{{1
" ==============================================================================

" ==============================================================================
" "Popup-menu"              Всплывающее меню {{{1
" ==============================================================================

" Переключение всплывающего меню neocomplcache
" (plugin-neocomplcache)
"nmenu PopUp.Toggle\ Neo\ PopUp\ menu :NeoComplCacheToggle<cr>
"imenu PopUp.Toggle\ Neo\ PopUp\ menu <esc>:NeoComplCacheToggle<cr>i

" Комментирование/раз комментирование участков текста
" (plugin-NERDCommenter)
nmenu PopUp.Source\ Code.Comment :call NERDComment(0,  "alignLeft")<CR>
vmenu PopUp.Source\ Code.Comment <ESC>:call NERDComment(1, "alignLeft")<CR>

nmenu PopUp.Source\ Code.Uncomment :call NERDComment(0, "uncomment")<CR>
vmenu PopUp.Source\ Code.Uncomment <ESC>:call NERDComment(1,  "uncomment")<CR>

nmenu PopUp.Source\ Code.Toggle :call NERDComment(0, "toggle")<CR>
vmenu PopUp.Source\ Code.Toggle <ESC>:call NERDComment(1,  "toggle")<CR>

vmenu PopUp.Source\ Code.-Usrsep1- :

" Добавление/удаление отступов к участкам кода
" (соотв. горячие клавиши клавиши должны быть определенны)
"nmenu <silent> PopUp.Source\ Code.Indent\ Block<tab><Ctrl-Tab> <C-tab>
vmenu <silent> PopUp.Source\ Code.Indent\ Block<tab><C-Tab> <C-tab>

"nmenu <silent>  PopUp.Source\ Code.Dedent\ Block<tab><C-S-Tab> <C-S-tab>
vmenu <silent>  PopUp.Source\ Code.Dedent\ Block<tab><C-S-Tab> <C-S-tab>

nmenu PopUp.Util.Context\ Help<tab><S-k> <S-k>
vmenu PopUp.Util.Context\ Help<tab><S-k> <esc><S-k>

" Открыть файл, в качестве имени используется слово под курсором
nmenu PopUp.Util.Open\ File\ Under\ Cursor<tab>gf gf
vmenu PopUp.Util.Open\ File\ Under\ Cursor<tab>gf gf

nmenu PopUp.Util.Jump\ Tag\ Under\ Cursor<tab><C-]> g<C-]>
vmenu PopUp.Util.Jump\ Tag\ Under\ Cursor<tab><C-]> g<C-]>

" Удалить лишние пробельные символы
nmenu <silent>  PopUp.Util.Clean\ Extra\ Spaces :call <SID>TrimWhiteSpace()<CR>

vmenu PopUp.Util.-Usrsep3- :

" Изменение регистра символов
vmenu PopUp.Util.Upper\ Case<tab>U U
vmenu PopUp.Util.Lower\ Case<tab>u u
vmenu PopUp.Util.Swap\ Case<tab>~ ~

au MenuPopup * call ToggleFTContextMenu("python","menu","PopUp.-Usrsep4-",":")

" Показ документации по объекту python над которым находится курсор
" (plugin-ropevim)
au MenuPopup * call ToggleFTContextMenu("python","nmenu","PopUp.Show\\ Documentation<tab><S-k>","RopeShowDoc()")
au MenuPopup * call ToggleFTContextMenu("python","imenu","PopUp.Show\\ Documentation><S-k>","RopeShowDoc()")

" Поиск места определения объекта под курсором (plugin-ropevim)
au MenuPopup * call ToggleFTContextMenu("python","imenu","PopUp.Goto\\ Definition<tab>gd","RopeGotoDefinition()")
au MenuPopup * call ToggleFTContextMenu("python","nmenu","PopUp.Goto\\ Definition<tab>gd","RopeGotoDefinition()")

" Поиск всех мест где используется объект, находящийся под
" курсором (plugin-ropevim)
au MenuPopup * call ToggleFTContextMenu("python","imenu","PopUp.Find\\ Occurrences","RopeFindOccurrences()")
au MenuPopup * call ToggleFTContextMenu("python","nmenu","PopUp.Find\\ Occurrences","RopeFindOccurrences()")

" Выполнить выделенный код (plugin-pyinteractive)
au MenuPopup * call ToggleFTContextMenu("python","vmenu","PopUp.Evaluate", "pyinteractive#EvaluateSelected(visualmode())")

" ==============================================================================
" "Plugin.TList"            {{{1
" ==============================================================================

let g:Tlist_Show_Menu = 0           " Показывать меню (0-выкл/1-вкл)
let g:Tlist_Show_One_File = 1       " Показывать список тегов только из текущего файла
let g:Tlist_Enable_Fold_Column = 0  " Показывать колонку свёртки (folding)

" ==============================================================================
" "Plugin.NERDTree"         {{{1
" ==============================================================================

" Установить положение окна NERDTree, "left" или "right"
let NERDTreeWinPos = 'right'

let NERDTreeShowBookmarks = 1
let NERDTreeIgnore = ['\~$', '*.pyc', '*.pyo']
let NERDChristmasTree = 0

" ==============================================================================
" "Plugin.SourceExplorer"   {{{1
" ==============================================================================

" Установка ширины окна SourceExplorer
let g:SrcExpl_winHeight = 8

" Интервал в миллисекундах (ms) для следующего обновления окна
let g:SrcExpl_refreshTime = 100

" Установка клавиши отвечающей за переход
" определению, по умолчанию "Enter"
let g:SrcExpl_jumpKey = "<ENTER>"

" Установка клавиши отвечающий за обратный переход от
" определения, назад к коду, по умолчанию "Space"
let g:SrcExpl_gobackKey = "<SPACE>"

" // In order to Avoid conflicts, the Source Explorer should know what plugins
" // are using buffers. And you need add their bufname into the list below
" // according to the command ":buffers!"
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_",
        \ "Source_Explorer"
    \ ]
" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1

" Включение опции обновления файла тегов во время открытия окна
" Source Explorer
let g:SrcExpl_isUpdateTags = 1

" Параметры вызова ctags
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."

" Автоматическое обновление файла тегов, после сохранения текущего файла
autocmd BufWritePost * :execute "silent!" . g:SrcExpl_updateTagsCmd

" ==============================================================================
" "Plugin.MRU" {{{1
" ==============================================================================

" Задание количества отображаемых в меню файлов
let g:MRU_Max_Entries = 100
"let g:MRU_Max_Menu_Entries = 20
let g:MRU_Add_Menu = 0
"let g:MRU_Window_Height =10 
"let g:MRU_Max_Submenu_Entries = 15
" ==============================================================================
" "Plugin.neocomplcache" {{{1
" ==============================================================================

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_ignore_case = 0
let g:neocomplcache_snippets_dir = '~/snippets'

" Если не выставить эту опцию то вырезание а затем вставка (в insert mode)
" через виндовые хоткеи страшно глючит
let g:neocomplcache_disable_select_mode_mappings = 1

" Включение/отключение автоматики Активация по Ctrl+Space
let g:neocomplcache_disable_auto_complete = 0

" ==============================================================================
" "Plugin.ropevim" {{{1
" ==============================================================================

let g:ropevim_vim_completion = 1

" ==============================================================================
" "Plugin.pythoncyntax" {{{1
" ==============================================================================

" Настройка подсветки синтаксиса для python (работает для
" расширенного syntax файла python)
let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0
let g:python_highlight_doctests = 0

" ==============================================================================
" "Plugin.Calendar" {{{1
" ==============================================================================

let g:calendar_monday = 1   " Неделя начинается с понедельника


" ==============================================================================
" "Plugin.vimwiki" {{{1
" ==============================================================================

" Меняем дефолтный браузер на лису 
 let g:vimwiki_browsers=['C:\Program Files\Mozilla Firefox\firefox.exe']
 " 
" ==============================================================================
" "Plugin.fontsize" {{{1
" ==============================================================================
" Slow down mapping timeout from default 1000 milliseconds.
  set timeoutlen=5000

" ==============================================================================
" "Functions"               Пользовательские функции {{{1
" ==============================================================================

let s:cmdline = ""

" Открытие файла приложением определённым по умолчанию
function! s:OpenFileInDefaultApp()
    if s:cmdline == ""
        execute '!"%"'
        "execute 'call system(shellescape(expand("<cfile>") ' . s:cmdline . '))'
    else
        execute '!"% ' . s:cmdline . '"'
    endif
endfunction

" Получение от пользователя командной строки с которой будет запускаться
" скрипт
function! <SID>GetCmdline()
    let s:cmdline=inputdialog("Enter command line parameters:", s:cmdline, s:cmdline)
endfunction

" Регистрация\удаление контекстного меню для конкретного типа файла
" lang (str)            - тип файла (например xml)
" menucommand (str)     - команда меню (например imenu)
" menuitem (str)        - название пункта меню
" action (str)          - функция выполняющая действие при
"                         активации пункта меню
function! ToggleFTContextMenu(lang, menucommand, menuitem, action)
    let command = a:menucommand . " " . a:menuitem . " <ESC>:call " . a:action . "<CR>"
    if &filetype == a:lang
        execute command
    else
        execute "silent! aunmenu " . a:menuitem
    endif
endfunction

" Удаление лишних пробелов в файле
function! <SID>TrimWhiteSpace()
    normal ma
    :retab
    :%s/\s\+$//eg
    normal 'a
endfunction

" Функция возвращает выделенный текст
function! GetSelection()
    " "unused"
        let l:line = getline("'<")
        let l:line = strpart(l:line, col("'<") - 1, col("'>") - col("'<") + 1)
        return l:line
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

" Функция возвращает "[mixed-indenting]" если для отступов в
" файле совместно используются пробелы и символы табуляции.
" Если же выставлена опция "expandtab" и в файле присутствуют
" символы табуляции то возвращаемое значение будет "[expandtab-enabled]".
" Так же в противоположном случае: если опция "expandtab" не задана
" но в файле для отступов используются пробелы возвращаемым
" значением будет "[expandtab-disabled]". В остальных случаях
" результатом функции будет пустая строка
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning = '[mixed-indenting]'
        elseif (spaces && !&expandtab)
            let b:statusline_tab_warning = '[expandtab-disabled]'
        elseif (tabs && &expandtab)
            let b:statusline_tab_warning = '[expandtab-enabled]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction

" Сделать из безымянного буфера scratch буфер
if s:us_scratch_buffer
    augroup vimrc-scratch-buffer
        autocmd!
        autocmd BufEnter * call s:scratch_buffer()
        autocmd FileType qfreplace autocmd! vimrc-scratch * <buffer>

        function! s:scratch_buffer()
            if exists('b:scratch_buffer') || bufname('%') != '' || &l:buftype != ''
                return
            endif
            let b:scratch_buffer = 1
            setlocal buftype=nofile nobuflisted noswapfile bufhidden=hide

            augroup vimrc-scratch
                autocmd! * <buffer>
                autocmd BufWriteCmd <buffer> call s:scratch_on_BufWriteCmd()
            augroup END
        endfunction

        function! s:scratch_on_BufWriteCmd()
            silent! setl buftype< buflisted< swapfile< bufhidden< nomodified
            autocmd! vimrc-scratch * <buffer>
            unlet! b:scratch_buffer
            execute 'saveas' . (v:cmdbang ? '!' : '') ' <afile>'
            filetype detect
        endfunction
    augroup END
endif
"function! PythonVarInfoBalloonExpr()
"    if &filetype!="python"
"        return ""
"    endif
"    v:beval_text
"endfunction

"set bexpr=PythonVarInfoBalloonExpr()
"set ballooneval

" ==============================================================================
" "Fix"                     Способы устранения непоняток с настройками {{{1
"
" Узнать из какого файла переменная была установлена посл. раз
"   :verbose set переменная
"
" Список всех переменных
"   :let
"
" Список всех пользовательских функций
"   :function
"
" Список всех привязок
"   :map
"
" Показывает значения всех опций, которые отличаются от настроек по умолчанию.
"   :set
" ==============================================================================
"}}}


