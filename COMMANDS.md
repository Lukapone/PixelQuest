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

## README.md Creation
```bash
# Create README.md file
cat > README.md << 'EOF'
[README content here]
EOF

# Commit and push README
git add README.md
git commit -m "docs: add README.md with project description and getting started guide"
git push
```

## README.md Features
- Project description and purpose
- Installation and getting started instructions
- Project structure overview
- Development commands reference
- Learning resources links
- Contributing guidelines

## README.md Update
```bash
# Remove project structure section from README.md
git add README.md
git commit -m "docs: remove project structure section from README.md"
git push
```

## Zig Cache Removal from Git
```bash
# Check if zig-cache files are tracked
git ls-files | grep zig-cache

# Remove zig-cache from git tracking and delete local directory
git rm -r --cached .zig-cache
rm -rf .zig-cache

# Check git status (should show deletions staged)
git status

# Commit and push the removal
git commit -m "fix: remove zig-cache from git tracking and local directory"
git push

# Verify zig-cache files are no longer tracked
git ls-files | grep zig-cache
```

## Final Status
✅ zig-cache completely removed from git tracking
✅ Local zig-cache directory deleted
✅ .gitignore properly configured to prevent future commits
✅ All changes pushed to GitHub
✅ Repository now clean without build artifacts

## File Naming Convention Update
```bash
# Rename commands.md to COMMANDS.md for consistent naming
git mv commands.md COMMANDS.md

# Commit and push the rename
git add .
git commit -m "docs: rename commands.md to COMMANDS.md for consistent naming"
git push
```

## Naming Convention
- All documentation files now use CAPITAL LETTERS
- README.md - Project documentation
- AGENTS.md - Development guidelines for AI agents
- COMMANDS.md - Command history and reference
- Consistent with common documentation naming standards

## AGENTS.md Typo Fixes
```bash
# Check git status for changes
git status

# Check what changes were made
git diff AGENTS.md

# Commit and push typo fixes
git add AGENTS.md
git commit -m "docs: fix typos in AGENTS.md - update commands.md references to COMMANDS.md"
git push
```

## Changes Made
- Updated references from `commands.md` to `COMMANDS.md` in AGENTS.md
- Fixed consistency with new filename convention
- All documentation now properly references COMMANDS.md

## AGENTS.md Troubleshooting Guidelines Update
```bash
# Add troubleshooting section to AGENTS.md
git add AGENTS.md
git commit -m "docs: add troubleshooting guidelines with Zig documentation links"
git push
```

## Troubleshooting Guidelines Added
- Always follow Zig documentation: https://ziglang.org/learn/
- Check Zig Language Reference: https://ziglang.org/documentation/
- Use `zig build --help` for build system options
- Pay attention to descriptive compiler error messages
- Refer to Ziglings for learning: https://ziglings.org/

## .gitignore Fix
```bash
# Check git status for changes
git status

# Check what changes were made to .gitignore
git diff .gitignore

# Commit and push .gitignore fix
git add .gitignore
git commit -m "fix: correct .gitignore pattern from zig-cache/ to .zig-cache/"
git push
```

## .gitignore Issue Fixed
- Changed `zig-cache/` to `.zig-cache/` to match actual directory name
- This ensures zig-cache files are properly ignored
- Important for keeping build artifacts out of repository

## Zig Format Integration
```bash
# Format all Zig source files before commit
zig fmt src/

# Check formatting results
git status

# Stage and commit with formatted code
git add .
git commit -m "docs: add zig fmt requirement to commit workflow and format existing code"
git push
```

## Code Formatting Policy
- ALWAYS run `zig fmt` before every commit
- Use `zig fmt src/` to format all source files
- Check git status to see formatting changes
- Include formatting in commit workflow
- Zig fmt follows official Zig style guidelines automatically
- No manual formatting needed - let zig fmt handle consistency

## NOTES.md Creation
```bash
# Create NOTES.md file with note-taking template
cat > NOTES.md << 'EOF'
[Template content]
EOF

# Commit and push NOTES.md
git add NOTES.md
git commit -m "docs: add NOTES.md for development note-taking"
git push
```

## NOTES.md Features
- Follows project naming convention (ALL CAPS)
- Markdown format for rich formatting
- Template sections for different note types
- Git-friendly for version control
- Integrates with existing documentation
