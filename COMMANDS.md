# PixelQuest - Command History and Reference

## Project Setup
```bash
# Create project directory and navigate into it
mkdir PixelQuest
cd PixelQuest

# Initialize Zig project
zig init
```

## Essential Development Commands
```bash
# Build and run game
zig build run

# Run all tests
zig build test

# Run tests with fuzzing
zig build test --fuzz

# Build without running
zig build

# Direct compilation (alternative)
zig build-exe src/main.zig

# Format all Zig source files
zig fmt src/

# Get help on build options
zig build --help
```

## Git Repository Setup
```bash
# Initialize git repository
git init

# Create .gitignore file
cat > .gitignore << 'EOF'
# Zig build artifacts
zig-out/
.zig-cache/

# OS specific
.DS_Store
Thumbs.db

# IDE files
.vscode/
.idea/
*.swp
*.swo

# Temporary files
*.tmp
*.log

# Executable
PixelQuest
EOF

# Check git configuration
git config --global user.name
git config --global user.email

# Add all files to git
git add .

# Create initial commit
git commit -m "Initial commit: PixelQuest Zig game project setup with .gitignore"

# Verify setup
git status
git log --oneline
```

## GitHub CLI Setup
```bash
# Install GitHub CLI
brew install gh

# Verify installation
gh --version

# Authenticate with GitHub (requires browser)
gh auth login

# Create repository and push
gh repo create PixelQuest --public --description "A Zig-based game learning project" --source=. --push

# Verify remote setup
git remote -v
```

## Future Game Development Commands
```bash
# Add dependencies (when needed)
zig fetch --save <dependency-url>

# Build for different targets
zig build -Dtarget=x86_64-windows

# Build with optimization
zig build -Doptimize=ReleaseFast

# Run specific test
zig test src/main.zig
```

## GitHub CLI Reference
```bash
# List repositories
gh repo list

# Create new repository
gh repo create <repo-name> --public/--private

# Clone repository
gh repo clone <username>/<repo-name>

# Create issue
gh issue create --title "Title" --body "Description"

# Create pull request
gh pr create --title "Title" --body "Description"

# View repository info
gh repo view
```

## Troubleshooting Commands
```bash
# Remove zig-cache from git tracking (if accidentally committed)
git rm -r --cached .zig-cache
rm -rf .zig-cache

# Check if zig-cache files are tracked
git ls-files | grep zig-cache

# Check git status for changes
git status

# Check what changes were made to a file
git diff <filename>

# Check staged changes
git diff --staged
```

## Repository Information
- **URL**: https://github.com/Lukapone/PixelQuest
- **Language**: Zig 0.15.2+
- **Structure**: Standard Zig module system
- **Documentation**: README.md, AGENTS.md, COMMANDS.md, NOTES.md

## Key Resources
- **Zig Documentation**: https://ziglang.org/documentation/
- **Zig Learn**: https://ziglang.org/learn/
- **Ziglings**: https://ziglings.org/
- **Vulkan Guide**: https://vkguide.dev/
- **Vulkan Tutorial**: https://vulkan-tutorial.com/
