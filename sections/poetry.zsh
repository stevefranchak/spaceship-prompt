#
# poetry
#
# poetry is a dependency manager tracking local dependencies of your projects and libraries.
# Link: https://github.com/python-poetry/poetry

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_POETRY_SHOW="${SPACESHIP_POETRY_SHOW=true}"
SPACESHIP_POETRY_PREFIX="${SPACESHIP_POETRY_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_POETRY_SUFFIX="${SPACESHIP_POETRY_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_POETRY_SYMBOL="${SPACESHIP_POETRY_SYMBOL="𝓅 "}"
SPACESHIP_POETRY_COLOR="${SPACESHIP_POETRY_COLOR="027"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show active poetry virtualenv for the current project.
spaceship_poetry() {
  [[ $SPACESHIP_POETRY_SHOW == false ]] && return

  # Show pyenv python version only for Python-specific folders
  # [[ -n "$PYENV_VERSION" || -f .python-version || -f requirements.txt || -f pyproject.toml || -n *.py(#qN^/) ]] || return

  spaceship::exists poetry || return # Do nothing if poetry is not installed

  local poetry_env_path=$(poetry env info -p 2>/dev/null)
  [[ $? -ne 0 ]] && return
  local poetry_status=$(echo $test | rev | cut -d '-' -f 1 | rev | sed s/py//)

  spaceship::section \
    "$SPACESHIP_POETRY_COLOR" \
    "$SPACESHIP_POETRY_PREFIX" \
    "${SPACESHIP_POETRY_SYMBOL}${poetry_status}" \
    "$SPACESHIP_POETRY_SUFFIX"
}
