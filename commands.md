# PixelQuest - Command History and Reference

## Project Setup Commands
```bash
# Create project directory and navigate into it
mkdir PixelQuest
cd PixelQuest

# Initialize Zig project
zig init
```

## Development Commands
```bash
# Build and run the game
zig build run

# Run all tests
zig build test

# Run tests with fuzzing
zig build test --fuzz

# Build without running
zig build

# Direct compilation (alternative)
zig build-exe src/main.zig

# Get help on build options
zig build --help
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

# Check code formatting (if formatter is available)
zig fmt src/
```

## Project Structure Created
- `build.zig` - Build configuration
- `build.zig.zon` - Project metadata
- `src/main.zig` - Main entry point
- `src/root.zig` - Core module
- `AGENTS.md` - Development guidelines
- `commands.md` - This command reference

## Notes
- Zig version 0.15.2+ required
- Project uses standard Zig module system
- Game loop structure ready for implementation

## Final Status
✅ Project successfully created and tested
✅ Basic game loop structure implemented
✅ AGENTS.md and commands.md created
✅ Ready for game development learning

## Next Steps for Learning
- Implement actual game loop with timing
- Add graphics rendering (consider using a graphics library)
- Add input handling
- Implement game state management
- Add game objects and physics

## Git Setup Commands
```bash
# Initialize git repository
git init

# Create .gitignore file
cat > .gitignore << 'EOF'
# Zig build artifacts
zig-out/
zig-cache/

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

## Git Status After Setup
✅ Git repository initialized
✅ .gitignore created and working
✅ Initial commit made
✅ zig-cache properly ignored
✅ All project files committed

## GitHub CLI Installation and Setup
```bash
# Install GitHub CLI
brew install gh

# Verify installation
gh --version

# Check authentication status
gh auth status

# Authenticate with GitHub (requires browser)
gh auth login

# Create repository and push
gh repo create PixelQuest --public --description "A Zig-based game learning project" --source=. --push
```

## GitHub CLI Commands Reference
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

## GitHub Repository Creation and Push
```bash
# Verify authentication
gh auth status

# Create repository and push
gh repo create PixelQuest --public --description "A Zig-based game learning project" --source=. --push

# Verify remote setup
git remote -v

# Commit and push documentation updates
git add .
git commit -m "docs: add GitHub CLI setup and command documentation policy"
git push
```

## Repository URL
https://github.com/Lukapone/PixelQuest

## Final Status
✅ GitHub repository created
✅ Code pushed to remote
✅ Remote origin configured
✅ Documentation updates committed and pushed
✅ All commands recorded in commands.md
