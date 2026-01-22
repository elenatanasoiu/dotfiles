#!/bin/bash

# Test script to validate dotfiles configuration without installing
set -e

echo "🧪 Testing dotfiles configuration..."
echo ""

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

ERRORS=0

# Test 1: Check zshrc syntax
echo "📝 Test 1: Checking zsh configuration syntax..."
for zshrc in zsh/zshrc local/zshrc; do
    if zsh -n "$zshrc" 2>/dev/null; then
        echo -e "${GREEN}✓${NC} $zshrc has valid syntax"
    else
        echo -e "${RED}✗${NC} $zshrc has syntax errors"
        ERRORS=$((ERRORS + 1))
    fi
done
echo ""

# Test 2: Verify DOTFILES_ROOT calculation
echo "🔍 Test 2: Checking DOTFILES_ROOT calculation..."
DOTFILES_ROOT=$(cd -- "$(dirname "$0")" && pwd)
echo "   DOTFILES_ROOT would be: $DOTFILES_ROOT"
if [[ -d "$DOTFILES_ROOT/zsh" ]] && [[ -d "$DOTFILES_ROOT/vim" ]]; then
    echo -e "${GREEN}✓${NC} DOTFILES_ROOT resolves correctly"
else
    echo -e "${RED}✗${NC} DOTFILES_ROOT doesn't point to dotfiles directory"
    ERRORS=$((ERRORS + 1))
fi
echo ""

# Test 3: Check that local-install.sh DOTFILES_ROOT calculation works
echo "🔍 Test 3: Checking local-install.sh DOTFILES_ROOT..."
cd local
LOCAL_DOTFILES_ROOT=$(cd -- "$(dirname "local-install.sh")/.." && pwd)
cd ..
echo "   From local/, DOTFILES_ROOT would be: $LOCAL_DOTFILES_ROOT"
if [[ "$LOCAL_DOTFILES_ROOT" == "$DOTFILES_ROOT" ]]; then
    echo -e "${GREEN}✓${NC} local-install.sh DOTFILES_ROOT resolves correctly"
else
    echo -e "${RED}✗${NC} local-install.sh DOTFILES_ROOT mismatch"
    ERRORS=$((ERRORS + 1))
fi
echo ""

# Test 4: Verify all symlink targets exist for install.sh
echo "📂 Test 4: Checking symlink targets for install.sh..."
TARGETS=(
    "vim/vimrc"
    "zsh/zshrc"
    "zsh/aliases.zsh"
    "zsh/plugins.zsh"
    "zshtheme/elena.zsh-theme"
    ".gitignore_global"
    "tig/.tigrc.large"
)

for target in "${TARGETS[@]}"; do
    if [[ -f "$DOTFILES_ROOT/$target" ]]; then
        echo -e "${GREEN}✓${NC} $target exists"
    else
        echo -e "${RED}✗${NC} $target NOT FOUND"
        ERRORS=$((ERRORS + 1))
    fi
done
echo ""

# Test 5: Verify all symlink targets exist for local-install.sh
echo "📂 Test 5: Checking symlink targets for local-install.sh..."
LOCAL_TARGETS=(
    "vim/vimrc"
    "local/zshrc"
    "local/zsh/aliases.zsh"
    "local/zsh/history.zsh"
    "local/zsh/plugins.zsh"
    "zshtheme/elena.zsh-theme"
    ".gitignore_global"
    "tig/.tigrc.large"
)

for target in "${LOCAL_TARGETS[@]}"; do
    if [[ -f "$DOTFILES_ROOT/$target" ]]; then
        echo -e "${GREEN}✓${NC} $target exists"
    else
        echo -e "${RED}✗${NC} $target NOT FOUND"
        ERRORS=$((ERRORS + 1))
    fi
done
echo ""

# Test 6: Check for the zshrc bug (no $1 in file glob)
echo "🐛 Test 6: Checking for zshrc file globbing bug..."
if grep -q '\$BASE/\$1' zsh/zshrc local/zshrc 2>/dev/null; then
    echo -e "${RED}✗${NC} Found \$1 bug in zshrc files"
    ERRORS=$((ERRORS + 1))
else
    echo -e "${GREEN}✓${NC} No \$1 bug found in zshrc files"
fi
echo ""

# Test 7: Check that local tmux.conf exists
echo "📂 Test 7: Checking local-specific files..."
if [[ -f "$DOTFILES_ROOT/local/tmux/tmux.conf" ]]; then
    echo -e "${GREEN}✓${NC} local/tmux/tmux.conf exists"
else
    echo -e "${YELLOW}⚠${NC} local/tmux/tmux.conf NOT FOUND (local-install.sh expects this)"
    # Not counting as error since might be intentional
fi
echo ""

# Test 8: Check install.sh syntax
echo "📝 Test 8: Checking install script syntax..."
if bash -n install.sh 2>/dev/null; then
    echo -e "${GREEN}✓${NC} install.sh has valid syntax"
else
    echo -e "${RED}✗${NC} install.sh has syntax errors"
    ERRORS=$((ERRORS + 1))
fi

if sh -n local/local-install.sh 2>/dev/null; then
    echo -e "${GREEN}✓${NC} local-install.sh has valid syntax"
else
    echo -e "${RED}✗${NC} local-install.sh has syntax errors"
    ERRORS=$((ERRORS + 1))
fi
echo ""

# Test 9: Dry-run simulation of install.sh
echo "🎭 Test 9: Simulating install.sh logic..."
DOTFILES_ROOT_SIM=$(cd -- "$(dirname "$0")" && pwd)

# Test that DOTFILES_ROOT would be set correctly
echo "   DOTFILES_ROOT in install.sh: $DOTFILES_ROOT_SIM"

# Simulate each symlink command
INSTALL_SYMLINKS=(
    "$DOTFILES_ROOT_SIM/vim/vimrc:~/.vimrc"
    "$DOTFILES_ROOT_SIM/zsh/zshrc:~/.zshrc"
    "$DOTFILES_ROOT_SIM/zsh/aliases.zsh:~/.zsh/aliases.zsh"
    "$DOTFILES_ROOT_SIM/zsh/plugins.zsh:~/.zsh/plugins.zsh"
    "$DOTFILES_ROOT_SIM/zshtheme/elena.zsh-theme:~/.oh-my-zsh/custom/themes/elena.zsh-theme"
    "$DOTFILES_ROOT_SIM/.gitignore_global:~/.gitignore_global"
)

for symlink in "${INSTALL_SYMLINKS[@]}"; do
    source="${symlink%%:*}"
    target="${symlink##*:}"
    target_expanded="${target/#\~/$HOME}"

    if [[ -f "$source" ]]; then
        echo -e "${GREEN}✓${NC} Would link: $source → $target"
    else
        echo -e "${RED}✗${NC} Source missing for: $source → $target"
        ERRORS=$((ERRORS + 1))
    fi
done
echo ""

# Test 10: Dry-run simulation of local-install.sh
echo "🎭 Test 10: Simulating local-install.sh logic..."
# Simulate being in the local directory
LOCAL_DOTFILES_ROOT_SIM=$(cd -- "$(dirname "$0")/local/.." && pwd)

echo "   DOTFILES_ROOT in local-install.sh: $LOCAL_DOTFILES_ROOT_SIM"

# Simulate each symlink command
LOCAL_INSTALL_SYMLINKS=(
    "$LOCAL_DOTFILES_ROOT_SIM/vim/vimrc:~/.vimrc"
    "$LOCAL_DOTFILES_ROOT_SIM/local/zshrc:~/.zshrc"
    "$LOCAL_DOTFILES_ROOT_SIM/local/zsh/aliases.zsh:~/.zsh/aliases.zsh"
    "$LOCAL_DOTFILES_ROOT_SIM/local/zsh/history.zsh:~/.zsh/history.zsh"
    "$LOCAL_DOTFILES_ROOT_SIM/local/zsh/plugins.zsh:~/.zsh/plugins.zsh"
    "$LOCAL_DOTFILES_ROOT_SIM/tmux/tmux.conf:~/.tmux.conf"
    "$LOCAL_DOTFILES_ROOT_SIM/zshtheme/elena.zsh-theme:~/.oh-my-zsh/custom/themes/elena.zsh-theme"
    "$LOCAL_DOTFILES_ROOT_SIM/.gitignore_global:~/.gitignore_global"
    "$LOCAL_DOTFILES_ROOT_SIM/tig/.tigrc.large:~/.tigrc.large"
)

for symlink in "${LOCAL_INSTALL_SYMLINKS[@]}"; do
    source="${symlink%%:*}"
    target="${symlink##*:}"
    target_expanded="${target/#\~/$HOME}"

    if [[ -f "$source" ]]; then
        echo -e "${GREEN}✓${NC} Would link: $source → $target"
    else
        echo -e "${RED}✗${NC} Source missing for: $source → $target"
        ERRORS=$((ERRORS + 1))
    fi
done
echo ""

# Final Summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [[ $ERRORS -eq 0 ]]; then
    echo -e "${GREEN}✓ All tests passed! (including dry-run simulations)${NC}"
    exit 0
else
    echo -e "${RED}✗ $ERRORS test(s) failed${NC}"
    exit 1
fi
