local mona_ue='  ∧＿∧    '
local mona_st='（　´∀｀）'

local shobon_ue='  ｼｮﾎﾞｰﾝ  '
local shobon_st=' （´･ω･`）'

local owata_ue='   ｵ ﾜ ﾀ  '
local owata_st=' \（^o^）/'

precmd() {
  local random_v=$((RANDOM % 10))
  #echo $random_v

  if [ $random_v -lt 1 ]; then
    sippai_ue=$owata_ue
    sippai_st=$owata_st
  else
    sippai_ue=$shobon_ue
    sippai_st=$shobon_st
  fi

  AA_ue="%(?,%{$fg[green]%}$mona_ue%{$reset_color%},%{$fg[red]%}$sippai_ue%{$reset_color%})"
  AA_st="%(?,%{$fg[green]%}$mona_st%{$reset_color%},%{$fg[red]%}$sippai_st%{$reset_color%})"
}

#local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"

# The plugin will auto execute this zvm_after_select_vi_mode function
local VIM_MODE="%F{cyan}--INSERT--%b"
function zvm_after_select_vi_mode() {
  case $ZVM_MODE in
    $ZVM_MODE_NORMAL)
      VIM_MODE="%F{blue}--NORMAL--%b"
    ;;
    $ZVM_MODE_INSERT)
      VIM_MODE="%F{cyan}--INSERT--%b"
    ;;
    $ZVM_MODE_VISUAL)
      VIM_MODE="%F{magenta}--VISUAL--%b"
    ;;
    $ZVM_MODE_VISUAL_LINE)
      VIM_MODE="%F{yellow}--VISUAL--%b"
    ;;
    $ZVM_MODE_REPLACE)
      VIM_MODE="%F{red}--REPLACE--%b"
    ;;
  esac
}

local user="%{$fg[cyan]%}%n%{$reset_color%}"
local host="%{$fg[cyan]%}@%m%{$reset_color%}"
local pwd="%{$fg[yellow]%}%~%{$reset_color%}"

PROMPT='${user}${host} ${pwd}
${AA_ue}    ${VIM_MODE}
${AA_st} <  '

RPROMPT='$(ruby_prompt_info) %{$fg[white]%}$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✔%{$reset_color%}"

ZSH_THEME_RUBY_PROMPT_PREFIX=""
ZSH_THEME_RUBY_PROMPT_SUFFIX=""
