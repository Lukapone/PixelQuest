# PixelQuest - Agent Development Guidelines

## Build/Test Commands
- `zig build run` - Build and run the game
- `zig build test` - Run all tests
- `zig build test --fuzz` - Run tests with fuzzing
- `zig build` - Build without running
- `zig build-exe src/main.zig` - Direct compilation

## Code Style Guidelines
- Use 4-space indentation (Zig standard)
- Prefer `const` over `var` when possible
- Use camelCase for variables, PascalCase for types
- Error handling with `try` and `catch` - never ignore errors
- Use `!void` for functions that can fail but don't return values
- Import statements at top: `const std = @import("std");`
- Use doc comments (`//!`) for module documentation
- Use regular comments (`//`) for implementation details

## Code Formatting
- ALWAYS run `zig fmt` before every commit
- Use `zig fmt` to format all Zig source files automatically
- Check formatting results with `git status` after running
- Zig fmt follows official Zig style guidelines
- No manual formatting needed - let zig fmt handle it

## Project Structure
- `src/main.zig` - Entry point with main() function
- `src/root.zig` - Core game logic and library exports
- `build.zig` - Build configuration and dependencies
- `build.zig.zon` - Project metadata and dependencies

## Testing
- Write tests using `test "test name" { ... }` blocks
- Use `std.testing.expect()` for assertions
- Test both success and error paths
- Include fuzz tests for input validation

## Game Development Specific
- Use game loop pattern in main()
- Separate game logic from rendering
- Consider using Zig's comptime for game constants
- Memory management: prefer arena allocators for game state

## Git Workflow Guidelines
- Use conventional commit messages: "type: description"
- Types: feat, fix, docs, style, refactor, test, chore
- Example: "feat: add player movement system"
- Keep commits small and focused
- Test before committing: `zig build test`
- Format code before committing: `zig fmt`

## Git Commands for Agents
- `git status` - Check working tree status
- `git add .` - Stage all changes
- `git commit -m "message"` - Create commit
- `git log --oneline` - Show commit history
- `git diff` - Show unstaged changes
- `git diff --staged` - Show staged changes

## Branching Strategy
- `main` - Stable production code
- `develop` - Integration branch
- `feature/*` - New features
- `fix/*` - Bug fixes

## Git Ignore Patterns
- Never commit zig-cache/ or zig-out/
- Ignore OS-specific files (.DS_Store)
- Ignore IDE files (.vscode/, .idea/)
- Ignore temporary files (*.tmp, *.log)

## GitHub CLI Usage
- Install with `brew install gh` on macOS
- Authenticate with `gh auth login` (requires browser)
- Create repos with `gh repo create <name> --public --source=. --push`
- Always record GitHub CLI commands in commands.md
- Use `gh --help` for available commands

## Troubleshooting Guidelines
- Always follow Zig documentation when troubleshooting issues: https://ziglang.org/learn/
- Check Zig Language Reference for syntax and API questions: https://ziglang.org/documentation/
- Use `zig build --help` to understand build system options
- Check compiler error messages carefully - they are often very descriptive
- Refer to Ziglings for learning Zig by fixing broken programs: https://ziglings.org/

## Terminal Command Documentation Policy
- ALL terminal commands must be recorded in COMMANDS.md
- Include command purpose and expected output
- Group commands by functionality (setup, development, deployment)
- Use code blocks for command formatting
- Include verification commands after setup
- Document any troubleshooting steps
- Update both COMMANDS.md and AGENTS.md when adding new tooling
- COMMANDS.md updates should be included with main commit, not separate commits
- Use `git add .` to include both main changes and COMMANDS.md updates together
- Commands in output are shown in bash tool descriptions for clarity
- Always include `zig fmt` in commit workflow documentation
- ONLY update COMMANDS.md when there are NEW commands not previously used
- Do not update COMMANDS.md for routine/repeated commands
