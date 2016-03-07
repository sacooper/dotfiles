" Change the color scheme from a list of color scheme names.
" Version 2010-09-12 from http://vim.wikia.com/wiki/VimTip341
" Press key:
"   F8                next scheme
"   Shift-F8          previous scheme
"   Alt-F8            random scheme
" Set the list of color schemes used by the above (default is 'all'):
"   :SetColors all              (all $VIMRUNTIME/colors/*.vim)
"   :SetColors my               (names built into script)
"   :SetColors blue slate ron   (these schemes)
"   :SetColors                  (display current scheme names)
" Set the current color scheme based on time of day:
"   :SetColors now
if v:version < 700 || exists('loaded_setcolors') || &cp
  finish
endif

let loaded_setcolors = 1
"let s:mycolors = ['slate', 'torte', 'darkblue', 'delek', 'murphy', 'elflord', 'pablo', 'koehler']  " colorscheme names that we use to set color

let s:mycolors = ['0x7A69_dark', '256-grayvim', '256-jungle', '3dglasses', 'abra', 'adam', 'adaryn', 'adobe', 'adrian', 'advantage', 'af', 'aiseered', 'anotherdark', 'ansi_blows', 'apprentice', 'aqua', 'ashen', 'asmanian_blood', 'astronaut', 'asu1dark', 'atom', 'automation', 'autumnleaf', 'autumn', 'babymate256', 'badwolf', 'base16-atelierdune', 'basic', 'baycomb', 'bayQua', 'bclear', 'beachcomber', 'beauty256', 'bensday', 'billw', 'biogoo', 'black_angus', 'blackbeauty', 'blackboard', 'blackdust', 'blacklight', 'BlackSea', 'blazer', 'blink', 'bluechia', 'bluedrake', 'bluegreen', 'blueprint', 'blueshift', 'blue', 'bluez', 'blugrine', 'bmichaelsen', 'bocau', 'bog', 'borland', 'breeze', 'brookstream', 'brown', 'bubblegum', 'burnttoast256', 'busierbee', 'busybee', 'buttercream', 'bvemu', 'bw', 'C64', 'cake16', 'calmar256-light', 'camo', 'campfire', 'candycode', 'candyman', 'candy', 'caramel', 'carrot', 'carvedwoodcool', 'carvedwood', 'cascadia', 'chance-of-storm', 'charged-256', 'charon', 'Chasing_Logic', 'chela_light', 'chlordane', 'ChocolateLiquor', 'ChocolatePapaya', 'chocolate', 'chrysoprase', 'ciscoacl', 'clarity', 'cleanphp', 'cleanroom', 'clearance', 'cloudy', 'clue', 'cobaltish', 'cobalt', 'codeblocks_dark', 'codeburn', 'CodeFactoryv3', 'codeschool', 'coffee', 'coldgreen', 'colorer', 'colorful256', 'colorful', 'colorscheme_template', 'colorzone', 'contrasty', 'cool', 'corn', 'corporation', 'cthulhian', 'custom', 'c', 'd8g_01', 'd8g_02', 'd8g_03', 'd8g_04', 'dante', 'darkblack', 'darkblue2', 'darkBlue', 'darkbone', 'darkburn', 'darkdot', 'darkeclipse', 'darkerdesert', 'darker-robin', 'darkocean', 'darkrobot', 'darkroom', 'dark-ruby', 'darkslategray', 'darkspectrum', 'darktango', 'darkzen', 'darkZ', 'darth', 'dawn', 'delek', 'delphi', 'denim', 'derefined', 'desert256v2', 'desert256', 'desertedoceanburnt', 'desertedocean', 'desertEx', 'desert', 'detailed', 'devbox-dark-256', 'DevC++', 'deveiate', 'developer', 'disciple', 'distinguished', 'django', 'donbass', 'doorhinge', 'doriath', 'dual', 'dull', 'dusk', 'earendel', 'earthburn', 'earth', 'eclipse', 'eclm_wombat', 'ecostation', 'editplus', 'edo_sea', 'ego', 'ekinivim', 'ekvoli', 'elda', 'elise', 'elisex', 'elrodeo', 'emacs', 'enzyme', 'evening_2', 'far', 'felipec', 'fine_blue', 'flatcolor', 'flatlandia', 'flatland', 'flattr', 'flatui', 'fnaqevan', 'fog', 'fokus', 'forneus', 'freya', 'frood', 'fruidle', 'fruit', 'fruity', 'fu', 'gardener', 'gemcolors', 'gentooish', 'getafe', 'getfresh', 'github', 'gobo', 'golded', 'golden', 'google', 'gor', 'gotham256', 'gotham', 'gothic', 'grape', 'gravity', 'graywh', 'grb256', 'greens', 'greenvision', 'grey2', 'greyblue', 'grishin', 'gruvbox', 'guardian', 'guepardo', 'h80', 'habiLight', 'harlequin', 'heliotrope', 'hemisu', 'herald', 'herokudoc-gvim', 'herokudoc', 'holokai', 'hornet', 'hybrid-light', 'hybrid', 'iangenzo', 'ibmedit', 'icansee', 'iceberg', 'impactG', 'impactjs', 'impact', 'industrial', 'industry', 'ingretu', 'inkpot', 'ir_black', 'ironman', 'jammy', 'jelleybeans', 'jellybeans', 'jellyx', 'jhdark', 'jhlight', 'jiks', 'kalisi', 'kaltex', 'kalt', 'kate', 'kellys', 'khaki', 'kib_darktango', 'kib_plastic', 'kiss', 'kkruby', 'kolor', 'kruby', 'kyle', 'landscape', 'last256', 'lazarus', 'legiblelight', 'leglight2', 'leo', 'less', 'lettuce', 'leya', 'lightcolors', 'lilac', 'lilydjwg_dark', 'lilydjwg_green', 'lilypink', 'lingodirector', 'liquidcarbon', 'literal_tango', 'lizard256', 'lizard', 'lodestone', 'louver', 'lucius', 'luinnar', 'luna', 'lxvc', 'mac_classic', 'made_of_code', 'mango', 'manuscript', 'manxome', 'marklar', 'maroloccio', 'mars', 'martin_krischik', 'matrix', 'mayansmoke', 'mdark', 'mellow', 'metacosm', 'midnight2', 'midnight', 'miko', 'mint', 'mizore', 'mod_tcsoft', 'molokai', 'monokai-chris', 'monokain', 'Monokai', 'montz', 'mophiaDark', 'mophiaSmoke', 'mopkai', 'moria', 'moss', 'motus', 'MountainDew', 'mrkn256', 'mrpink', 'mud', 'muon', 'mustang', 'native', 'nature', 'navajo-night', 'navajo', 'nazca', 'nedit2', 'nedit', 'nefertiti', 'neon', 'nerv-ous', 'neutron', 'neverland2-darker', 'neverland2', 'neverland-darker', 'neverland', 'neverness', 'nevfn', 'newspaper', 'newsprint', 'nicotine', 'nightflight2', 'nightflight', 'nightshimmer', 'nightsky', 'night', 'night_vision', 'nightVision', 'nightwish', 'no_quarter', 'northland', 'northsky', 'norwaytoday', 'nour', 'nuvola', 'obsidian2', 'obsidian', 'oceanblack256', 'oceanblack', 'oceandeep', 'oceanlight', 'olive', 'orange', 'osx_like', 'otaku', 'pacific', 'paintbox', 'PapayaWhip', 'PaperColor', 'peaksea', 'pencil', 'peppers', 'perfect', 'pf_earth', 'phd', 'phphaxor', 'phpx', 'pic', 'pink', 'playroom', 'pleasant', 'potts', 'primary', 'print_bw', 'prmths', 'professional', 'proton', 'pspad', 'psql', 'putty', 'pw', 'pyte', 'python', 'quagmire', 'radicalgoodspeed', 'railscasts', 'rainbow_fine_blue', 'rainbow_fruit', 'rainbow_neon', 'random', 'rastafari', 'rcg_gui', 'rcg_term', 'rdark-terminal', 'rdark', 'redblack', 'redstring', 'refactor', 'relaxedgreen', 'reliable', 'reloaded', 'revolutions', 'robinhood', 'rootwater', 'rtl', 'sand', 'satori', 'saturn', 'scala', 'scite', 'sean', 'seashell', 'sea', 'selenitic', 'seoul256-light', 'seoul256', 'seoul', 'seti', 'settlemyer', 'sexy-railscasts', 'sf', 'shadesofamber', 'shobogenzo', 'sienna', 'sift', 'silent', 'simple256', 'simpleandfriendly', 'simple_b', 'simplewhite', 'skittles_berry', 'skittles_dark', 'SlateDark', 'smp', 'smyck', 'softbluev2', 'softblue', 'softlight', 'solarized', 'sol-term', 'sol', 'sonofobsidian', 'sonoma', 'sorcerer', 'soso', 'southernlights', 'southwest-fog', 'spectro', 'spiderhawk', 'spring', 'stackoverflow', 'stingray', 'strange', 'strawimodo', 'summerfruit256', 'summerfruit', 'surveyor', 'swamplight', 'symfony', 'synic', 'tabula', 'tango2', 'tango-desert', 'tango-morning', 'tangoshady', 'tango', 'tangoX', 'taqua', 'tchaba2', 'tchaba', 'tcsoft', 'telstar', 'tesla', 'tetragrammaton', 'textmate16', 'thegoodluck', 'thestars', 'thor', 'tibet', 'tidy', 'tir_black', 'tolerable', 'tomatosoup', 'Tomorrow-Night-Blue', 'Tomorrow-Night-Bright', 'Tomorrow-Night-Eighties', 'Tomorrow-Night', 'Tomorrow', 'tony_light', 'toothpik', 'torte', 'transparent', 'trivial256', 'trogdor', 'turbo', 'tutticolori', 'twilight256', 'twilight', 'twitchy', 'two2tango', 'ubloh', 'umber-green', 'understated', 'underwater-mod', 'underwater', 'up', 'vanzan_color', 'vcbc', 'vc', 'vexorian', 'vibrantink', 'vilight', 'visualstudio', 'vividchalk', 'vj', 'void', 'vydark', 'vylight', 'wargrey', 'warm_grey', 'watermark', 'whitebox', 'whitedust', 'widower', 'win9xblueback', 'wintersday', 'winter', 'wombat256i', 'wombat256mod', 'wombat256', 'wombat', 'wood', 'wuye', 'xemacs', 'xian', 'xmaslights', 'xoria256', 'xterm16', 'yaml', 'yeller', 'zazen', 'zenburn', 'zenesque', 'zen', 'zephyr', 'zmrok']


" Set list of color scheme names that we will use, except
" argument 'now' actually changes the current color scheme.
function! s:SetColors(args)
  if len(a:args) == 0
    echo 'Current color scheme names:'
    let i = 0
    while i < len(s:mycolors)
      echo '  '.join(map(s:mycolors[i : i+4], 'printf("%-14s", v:val)'))
      let i += 5
    endwhile
  elseif a:args == 'all'
    let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
    let s:mycolors = map(paths, 'fnamemodify(v:val, ":t:r")')
    echo 'List of colors set from all installed color schemes'
  elseif a:args == 'my'
    let c1 = 'default elflord peachpuff desert256 breeze morning'
    let c2 = 'darkblue gothic aqua earth black_angus relaxedgreen'
    let c3 = 'darkblack freya motus impact less chocolateliquor'
    let s:mycolors = split(c1.' '.c2.' '.c3)
    echo 'List of colors set from built-in names'
  elseif a:args == 'now'
    call s:HourColor()
  else
    let s:mycolors = split(a:args)
    echo 'List of colors set from argument (space-separated names)'
  endif
endfunction

command! -nargs=* SetColors call s:SetColors('<args>')

" Set next/previous/random (how = 1/-1/0) color from our list of colors.
" The 'random' index is actually set from the current time in seconds.
" Global (no 's:') so can easily call from command line.
function! NextColor(how)
  call s:NextColor(a:how, 1)
endfunction

" Helper function for NextColor(), allows echoing of the color name to be
" disabled.
function! s:NextColor(how, echo_color)
  if len(s:mycolors) == 0
    call s:SetColors('all')
  endif
  if exists('g:colors_name')
    let current = index(s:mycolors, g:colors_name)
  else
    let current = -1
  endif
  let missing = []
  let how = a:how
  for i in range(len(s:mycolors))
    if how == 0
      let current = localtime() % len(s:mycolors)
      let how = 1  " in case random color does not exist
    else
      let current += how
      if !(0 <= current && current < len(s:mycolors))
        let current = (how>0 ? 0 : len(s:mycolors)-1)
      endif
    endif
    try
      execute 'colorscheme '.s:mycolors[current]
      break
    catch /E185:/
      call add(missing, s:mycolors[current])
    endtry
  endfor
  redraw
  if len(missing) > 0
    echo 'Error: colorscheme not found:' join(missing)
  endif
  if (a:echo_color)
    echo g:colors_name
  endif
endfunction

nnoremap <F8> :call NextColor(1)<CR>
nnoremap <S-F8> :call NextColor(-1)<CR>
nnoremap <A-F8> :call NextColor(0)<CR>

" Set color scheme according to current time of day.
function! s:HourColor()
  let hr = str2nr(strftime('%H'))
  if hr <= 3
    let i = 0
  elseif hr <= 7
    let i = 1
  elseif hr <= 14
    let i = 2
  elseif hr <= 18
    let i = 3
  else
    let i = 4
  endif
  let nowcolors = 'elflord morning desert evening pablo'
  execute 'colorscheme '.split(nowcolors)[i]
  redraw
  echo g:colors_name
endfunction
